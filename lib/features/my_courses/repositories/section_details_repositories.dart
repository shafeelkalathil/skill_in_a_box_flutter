import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/lesson_model/lesson_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/quiz_status_model/quiz_status_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/section_model/section_details_model/section_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/section_model/section_details_request_model/section_details_request_model.dart';

final sectionDetailsRepositoryProvider = Provider<SectionDetailsRepositories>(
  (ref) => SectionDetailsRepositories(),
);

class SectionDetailsRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, SectionDetailsModel>> getSectionDetails({
    required String courseId,
    required String sectionId,
  }) async {
    final requestModel = SectionDetailsRequestModel(
      courseId: courseId,
      sectionId: sectionId,
    );
    try {
      print('get section details : course id $courseId,section id $sectionId');
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.sectionDetailsfetchEndpoint,
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        final result = SectionDetailsModel.fromJson(response.data!);
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

  Future<Either<String, LessonModel>> getLessonDetails({
    required String courseId,
    required String sectionId,
    required String lessonId,
  }) async {
    final requestModel = SectionDetailsRequestModel(
      courseId: courseId,
      sectionId: sectionId,
    );
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.lessonDetailsfetchEndpoint}$lessonId',
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        final result = LessonModel.fromJson(response.data!);
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

  Future<Either<String, Map<String,dynamic>>> updateLessonProgress({
    required String courseId,
    required String sectionId,
    required String lessonId,
    required double currentProgress,
    required bool isFinished,
  }) async {
    print('=======================');
    print(courseId);
    print(sectionId);
    print(lessonId);
    print('=======================');
    print('call lesson progress');
    final data = {
      'sectionId': sectionId,
      'courseId': courseId,
      'currentProgress': currentProgress,
      'isFinished': isFinished,
      'lessonId': lessonId
    };
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.updateLessonProgressEndpoint}$lessonId',
        data: data,
      );
      if (response.statusCode == 201) {
        return right(response.data!);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }

  Future<Either<String, QuizStatusModel>> getQuizStatus({
    required String courseId,
    required String sectionId,
    required String quizId,
  }) async {
    final requestModel = SectionDetailsRequestModel(
      courseId: courseId,
      sectionId: sectionId,
    );
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        '${ApiConstants.quizStatusfetchEndpoint}$quizId',
        data: requestModel.toJson(),
      );
      if (response.statusCode == 201) {
        final result = QuizStatusModel.fromJson(response.data!);
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
}
