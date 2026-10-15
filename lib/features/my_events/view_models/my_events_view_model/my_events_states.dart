import 'package:skill_in_a_box_flutter/features/my_events/models/my_events_model/my_events_model.dart';

abstract class MyEventsState {
  MyEventsState({this.myEventsModel});
  final MyEventsModel? myEventsModel;
}

class MyEventsInitial implements MyEventsState {
  @override
  MyEventsModel? get myEventsModel => null;
}

class MyEventsLoading implements MyEventsState {
  MyEventsLoading(this.myEvents);
  MyEventsModel? myEvents;
  @override
  MyEventsModel? get myEventsModel => myEvents;
}

class MyEventsSuccess implements MyEventsState {
  MyEventsSuccess(this.myEvents);
  MyEventsModel? myEvents;
  @override
  MyEventsModel? get myEventsModel => myEvents;
}

class MyEventsFailed implements MyEventsState {
  MyEventsFailed({required this.errorMessage, this.myEvents});
  final String errorMessage;
  MyEventsModel? myEvents;
  @override
  MyEventsModel? get myEventsModel => myEvents;
}
