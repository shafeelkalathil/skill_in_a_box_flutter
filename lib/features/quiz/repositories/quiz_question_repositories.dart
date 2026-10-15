import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_question/quiz_question_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/save_question/save_question.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/save_question_answer/save_question_body.dart';

final quizQuestionRepositoriesProvider =
Provider<QuizQuestionRepositories>((ref) => QuizQuestionRepositories(),);

class QuizQuestionRepositories{

  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, QuizQuestionModel>> getQuizQuestion
      ({required QuizBodyParams quizSummaryParams,
        required int questionNo,}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'quizId': quizSummaryParams.quizId,
        'courseId': quizSummaryParams.courseId,
        'sectionId': quizSummaryParams.sectionId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.quizEndpoint}${ApiConstants.questionEndpoint}/$questionNo',
        data: data,
      );

      if (response.statusCode == 201) {
        final result = QuizQuestionModel.fromJson(response.data!);
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

  Future<Either<String, SaveQuestionModel>> saveQuestionAnswer
      ({required SaveQuestionBody saveQuizBody,
    required int questionNo,}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = SaveQuestionBody(
          questionId: saveQuizBody.questionId,
          courseId: saveQuizBody.courseId,
          sectionId: saveQuizBody.sectionId,
          quizId: saveQuizBody.quizId,
          submittedAnswer: saveQuizBody.submittedAnswer,
          submittedLanguage: saveQuizBody.submittedLanguage,
      );

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.questionEndpoint}/$questionNo',
        data: data,
      );

      if (response.statusCode == 201) {
        final result = SaveQuestionModel.fromJson(response.data!);
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

  Future<Either<String, Map<String,dynamic>>> submitQuiz
      ({required QuizBodyParams quizSummaryParams}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = {
        'courseId':quizSummaryParams.courseId,
        'sectionId':quizSummaryParams.sectionId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.submitQuizEndpoint}/${quizSummaryParams.quizId}',
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

}
