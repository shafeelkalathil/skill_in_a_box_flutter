import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/constants/api_constants.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/event/models/event_details/event_model.dart';
import 'package:skill_in_a_box_flutter/features/event/models/event_list/event_list_model.dart';

final eventsRepositoryProvider = Provider(
  (ref) => EventsRepository(),
);

class EventsRepository {
  final DioClient _dioClient = getIt<DioClient>();
  final _exceptionHandler = getIt<ExceptionHandler>();

  Future<Either<String, EventListModel>> getFilteredEvents() async {
    try {
      final response = await _dioClient.dio.post<Map<String, dynamic>>(
        ApiConstants.filteredEventsEndpoint,
      );
      if (response.statusCode == 201) {
        final result = EventListModel.fromJson(response.data!);
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

  Future<Either<String, EventModel>> getEventDetails(
    String eventId, {
    bool isMyEvent = false,
  }) async {
    try {
      final response = await _dioClient.dio.get<Map<String, dynamic>>(
        isMyEvent
            ? '${ApiConstants.myEventDetailsEndPoint}$eventId'
            : '${ApiConstants.eventDetailsEndpoint}$eventId',
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

}
