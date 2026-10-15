import 'package:skill_in_a_box_flutter/features/event/models/event_details/event_model.dart';

abstract class EventDetailsState {}

class EventDetailsInitial extends EventDetailsState {}

class EventDetailsLoading extends EventDetailsState {}

class EventDetailsSuccess extends EventDetailsState {
  EventDetailsSuccess({
    required this.eventData,
  });
  final EventModel eventData;
}

class EventDetailsFailed extends EventDetailsState {
  EventDetailsFailed(this.errorMessage);
  final String errorMessage;
}
