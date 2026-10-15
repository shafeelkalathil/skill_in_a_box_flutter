import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/quiz_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/start_quiz_model/start_quiz_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';

import '../../my_courses/model/quiz_status_model/quiz_status_model.dart';

final quizOverviewRepositoryProvider =
Provider<QuizOverviewRepository>((ref) => QuizOverviewRepository(),);

class QuizOverviewRepository{

  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, QuizStatusModel>> getQuizStatus
      ({required QuizBodyParams quizSummaryParams}) async {
    try {
      print('===============================');
      print(quizSummaryParams.courseId);
      print(quizSummaryParams.sectionId);
      print(quizSummaryParams.quizId);
      print('===============================');

      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'courseId':quizSummaryParams.courseId,
        'sectionId':quizSummaryParams.sectionId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.quizStatusfetchEndpoint}/${quizSummaryParams.quizId}',
        data: data,
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
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, QuizOverviewModel>> getQuizOverview
      ({required QuizBodyParams quizSummaryParams}) async {
    try {
      print('===============================');
      print(quizSummaryParams.courseId);
      print(quizSummaryParams.sectionId);
      print(quizSummaryParams.quizId);
      print('===============================');

      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'courseId':quizSummaryParams.courseId,
        'sectionId':quizSummaryParams.sectionId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.quizEndpoint}${ApiConstants.overviewEndpoint}/${quizSummaryParams.quizId}',
        data: data,
      );

      if (response.statusCode == 201) {
        final result = QuizOverviewModel.fromJson(response.data!);
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


  Future<Either<String, StartQuizModel>> startQuiz
      ({required QuizBodyParams quizSummaryParams}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'courseId':quizSummaryParams.courseId,
        'sectionId':quizSummaryParams.sectionId,
      };

      final response = await _dioClient.dio.post<Map<String,dynamic>>(
        '${ApiConstants.quizEndpoint}${ApiConstants.startQuizEndpoint}/${quizSummaryParams.quizId}',
        data: data,
      );

      if (response.statusCode == 201) {
        final result = StartQuizModel.fromJson(response.data!);
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
