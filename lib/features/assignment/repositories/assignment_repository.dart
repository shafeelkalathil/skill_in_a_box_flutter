import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/assignment/models/assignment_model/assignment_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/models/get_assignment/get_assignment_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/models/resubmit_request/resubmit_request_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/models/upload_assignment/upload_assignment_model.dart';

final assignmentRepositoryProvider = Provider<AssignmentRepository>(
  (ref) => AssignmentRepository(),
);

class AssignmentRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, AssignmentModel>> getAssignment({
    required String courseId,
    required String lessonId,
    required String sectionId,
  }) async {
    final requestModel =
        GetAssignmentModel(courseId: courseId, sectionId: sectionId);
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.getAssignmentEndpoint}$lessonId',
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        final result = AssignmentModel.fromJson(response.data!);
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

  Future<Either<String, bool>> uploadAssignment({
    required UploadAssignmentModel uploadModel,
  }) async {
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.uploadAssignmentEndpoint,
        data: uploadModel.toJson(),
      );
      if (response.statusCode == 201) {
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

  Future<Either<String, bool>> requestResubmission({
    required String courseId,
    required String lessonId,
    required String sectionId,
  }) async {
    final requestModel = ResubmitRequestModel(
      assignmentId: lessonId,
      sectionId: sectionId,
      courseId: courseId,
      type: 'Course',
    );
    try {
      final response = await _dioClient.dio.patch<Map<String, dynamic>>(
        ApiConstants.uploadAssignmentEndpoint,
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
