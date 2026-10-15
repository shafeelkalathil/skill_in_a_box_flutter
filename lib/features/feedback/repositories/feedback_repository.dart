import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/feedback/models/feedback_form/feedback_form_model.dart';

final feedbackRepositoryProvider = Provider(
  (ref) => FeedbackRepository(),
);

class FeedbackRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, FeedbackFormModel>> getFeedbackForm({
    required String usage,
    required String id,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.getFeedbackFormEndpoint}$usage&id=$id',
      );
      if (response.statusCode == 200) {
        final result = FeedbackFormModel.fromJson(response.data!);
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
