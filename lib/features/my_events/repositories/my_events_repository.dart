import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/event/models/event_details/event_model.dart';
import 'package:skill_in_a_box_flutter/features/my_events/models/my_events_model/my_events_model.dart';
import 'package:skill_in_a_box_flutter/features/my_events/models/online_event_model/online_event_model.dart';



final myEventsRepositoryProvider = Provider(
  (ref) => MyEventsRepository(),
);

class MyEventsRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, MyEventsModel>> fetchMyEvents() async {
      try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        ApiConstants.listMyEventsEndPoint,
      );
      if (response.statusCode == 200) {
        final result = MyEventsModel.fromJson(response.data!);
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

  Future<Either<String, EventModel>> fetchMyEventDetails() async {
      try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        ApiConstants.myEventDetailsEndPoint,
      );
      if (response.statusCode == 200) {
        final result = EventModel.fromJson(response.data!);
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

  Future<Either<String, OnlineEventModel>> fetchOnlineEventDetails(String eventId) async {
      try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        '${ApiConstants.joinMyEventEndpoint}$eventId',
      );
      if (response.statusCode == 200) {
        final result = OnlineEventModel.fromJson(response.data!);
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
