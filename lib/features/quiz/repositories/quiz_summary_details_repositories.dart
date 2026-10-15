import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary_details/quiz_summary_details_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';

final quizSummaryDetailsRepositoryProvider =
Provider<QuizSummaryDetailsRepository>((ref) =>
    QuizSummaryDetailsRepository(),);

class QuizSummaryDetailsRepository{

  final _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  /// Fetches certificate details.
  Future<Either<String, QuizSummaryDetailsModel>> getQuizSummaryDetails
      ({required QuizBodyParams quizSummaryParams}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';
      final data = <String,String>{
        'courseId':quizSummaryParams.courseId,
        'sectionId':quizSummaryParams.sectionId,
      };
      final response = await _dioClient.dio.post<Map<String,dynamic>>(
          '${ApiConstants.quizSummaryEndpoint}/${ApiConstants.quizSummaryDetailsEndpoint}/${quizSummaryParams.quizId}',
          data: data,
      );
      if (response.statusCode == 201) {
        print(response.data);
        print('response.data!');
        final result = QuizSummaryDetailsModel.fromJson(response.data!);
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
