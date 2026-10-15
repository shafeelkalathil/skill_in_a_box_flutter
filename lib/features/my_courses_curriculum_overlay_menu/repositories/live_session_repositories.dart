import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/book_live_session/book_live_session_model.dart';

final liveSessionRepositoriesProvider = Provider<LiveSessionRepositories>(
  (ref) => LiveSessionRepositories(),
);

class LiveSessionRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, BookLiveSessionModel>> listAllSlots({
    required String courseId,
    required String date,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.listAllSlotsEndpoint}startDate=$date&endDate=$date&courseId=$courseId',
      );
      if (response.statusCode == 200) {
        final result = BookLiveSessionModel.fromJson(response.data!);
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

  Future<Either<String, bool>> bookSlot({
    required String slotId,
    required String topic,
  }) async {
    try {
      final response = await _dioClient.dio.patch<Map<String, dynamic>>(
        '${ApiConstants.bookSlotEndpoint}$slotId',
        data: {'topic': topic},
      );
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(
          e.response?.data['message'].toString() ?? 'Something wrong!',
        );
      }

      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occured');
    }
  }
}
