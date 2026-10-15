import 'package:skill_in_a_box_flutter/features/event/models/event_list/event_list_model.dart';

abstract class EventsState {
  EventsState({this.events});
  final EventListModel? events;
}

class EventsInitial implements EventsState {
  @override
  EventListModel? get events => null;
}

class EventsLoading implements EventsState {
  EventsLoading({this.listOfEvents});
  final EventListModel? listOfEvents;
  @override
  EventListModel? get events => listOfEvents;
}

class EventsSuccess implements EventsState {
  EventsSuccess({this.listOfEvents});
  final EventListModel? listOfEvents;
  @override
  EventListModel? get events => listOfEvents;
}

class EventsFailed implements EventsState {
  EventsFailed(this.errorMessage,{this.listOfEvents});
  final EventListModel? listOfEvents;
  @override
  EventListModel? get events => listOfEvents;
  final String errorMessage;
}
