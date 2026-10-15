import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_question_params.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/exam_submission_model/exam_submission_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/final_exam_question_model/final_exam_question_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/final_exam_status_model/final_exam_status_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/save_exam_answer_model/save_exam_answer_model.dart';
import 'package:skill_in_a_box_flutter/features/final_exam/model/save_exam_params.dart';

final finalExamRepositoriesProvider =
Provider<FinalExamRepositories>((ref) => FinalExamRepositories(),);

class FinalExamRepositories{

  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, FinalExamStatusModel>> finalExamStatus
      ({required String courseId,required String examId}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.dio.get<Map<String,dynamic>>(
        ApiConstants.finalExamStatusEndpoint,
        queryParameters: {
          'examId' : examId,
          'courseId': courseId,
        },
      );
      if (response.statusCode == 200) {
        final result = FinalExamStatusModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, Map<String,dynamic>>> startFinalExam
      ({required String courseId,required String examId}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.dio.get<Map<String,dynamic>>(
        ApiConstants.startFinalExamEndpoint,
        queryParameters: {
          'examId' : examId,
          'courseId': courseId,
        },
      );
      if (response.statusCode == 200) {
        final result = response.data!;
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, FinalExamQuestionModel>> getExamQuestion
      ({required ExamQuestionParams examQuestionParams,
    required int questionNo,}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'examId' : examQuestionParams.examId,
        'courseId' : examQuestionParams.courseId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.examEndpoint}${ApiConstants.questionEndpoint}/$questionNo',
        data: data,
      );

      if (response.statusCode == 201) {
        final result = FinalExamQuestionModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, SaveExamAnswerModel>> saveAnswer
      ({required SaveExamParams saveExamParams,
    required int questionNo,}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,dynamic>{
        'courseId': saveExamParams.courseId,
        'examId':saveExamParams.examId,
        'questionId':saveExamParams.questionId,
        'submittedLanguage':saveExamParams.submittedLanguage,
        'submittedAnswer':saveExamParams.submittedAnswer,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.examEndpoint}${ApiConstants.saveAnswerEndpoint}/$questionNo',
        data: data,
      );

      if (response.statusCode == 201) {
        final result = SaveExamAnswerModel.fromJson(response.data!);
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, Map<String,dynamic>>> submitExam
      ({required String courseId,required String examId,}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,dynamic>{
        'courseId': courseId,
        'examId': examId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        ApiConstants.startFinalExamEndpoint,
        data: data,
      );

      if (response.statusCode == 201) {
        final result = response.data!;
        return right(result);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, ExamSubmissionModel>> submissionDetails
      ({required String courseId,required String examId}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.dio.get<Map<String,dynamic>>(
        ApiConstants.examSubmissionDetailsEndpoint,
        queryParameters: {
          'examId' : examId,
          'courseId': courseId,
        },
      );
      if (response.statusCode == 200) {
        final result = ExamSubmissionModel.fromJson(response.data!);
        return right(result);
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
