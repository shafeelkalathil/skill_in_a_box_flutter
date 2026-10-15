import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/mux_player_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/features/shared/model/mux_asset_by_id_model/mux_asset_by_id_model.dart';


final muxVideoPlayerRepositoriesProvider = Provider<MuxVideoPlayerRepositories>(
      (ref) => MuxVideoPlayerRepositories(),
);

class MuxVideoPlayerRepositories {
  final dio = Dio();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, MuxAssetByIdModel>> fetchMuxAssetById
      ({ required String assetId, }) async {
    final basicAuth = 'Basic ${base64Encode(utf8.encode(
        '${MuxPlayerConstants.muxApiKey}:${MuxPlayerConstants.muxApiSecret}',
    ),)}';

    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${MuxPlayerConstants.getAssetByIdEndPoint}$assetId',
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return right(MuxAssetByIdModel.fromJson(response.data!));
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }
}
