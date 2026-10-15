import 'package:skill_in_a_box_flutter/features/my_events/models/online_event_model/online_event_model.dart';

abstract class JoinEventState {}

class JoinEventInitial extends JoinEventState {}

class JoinEventLoading extends JoinEventState {}

class JoinEventSuccess extends JoinEventState {
  JoinEventSuccess({
    required this.onlineEvent,
  });
  final OnlineEventModel onlineEvent;
}

class JoinEventFailed extends JoinEventState {
  JoinEventFailed(this.errorMessage);
  final String errorMessage;
}
