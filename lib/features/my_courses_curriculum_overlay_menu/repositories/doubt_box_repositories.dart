import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/doubt_box/handling_like_model/handling_like_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/doubt_box/section_details_model/doubt_box_section_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/doubt_box/section_model/doubt_box_section_model.dart';

final doubtBoxRepositoryProvider = Provider<DoubtBoxRepository>(
  (ref) => DoubtBoxRepository(),
);

class DoubtBoxRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, DoubtBoxSectionModel>> getSections({
    required String courseId,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.getDoubtBoxSectionsEndpoint}$courseId',
      );
      if (response.statusCode == 200) {
        final result = DoubtBoxSectionModel.fromJson(response.data!);
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

  Future<Either<String, DoubtBoxSectionDetailsModel>> getSectionDetails({
    required String courseId,
    required String sectionId,
  }) async {
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.getDoubtBoxSectionDetailsEndpoint}$sectionId',
        data: {'courseId': courseId},
      );
      if (response.statusCode == 201) {
        final result = DoubtBoxSectionDetailsModel.fromJson(response.data!);
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

  Future<Either<String, bool>> handlingLike({
    required String courseId,
    required String sectionId,
    required String doubtId,
    required String type,
  }) async {
    try {
      final requestModel = HandlingLikeModel(
        courseId: courseId,
        sectionId: sectionId,
        type: type,
      );
      final response = await _dioClient.dio.patch<Map<String, dynamic>>(
        '${ApiConstants.doubtBoxLikeEndpoint}$doubtId',
        data: requestModel.toJson(),
      );
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
