import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/basic_details_model/basic_details_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/update_details_model/update_details_model.dart';

final basicDetailsRepositoryProvider =
    Provider((ref) => BasicDetailsRepository());

class BasicDetailsRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, BasicDetailsModel>> getBasicDetails() async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '/basicDetails',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final result = BasicDetailsModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, bool>> updateBasicDetails(
      UpdateDetailsModel dataModel,) async {
    try {
      final response = await _dioClient.dio
          .patch<dynamic>('/profile/update', data: dataModel.toJson());
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }
}
