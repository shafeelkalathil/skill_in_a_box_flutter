
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_data_model/course_extend_data_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_validity_model.dart';

import 'package:skill_in_a_box_flutter/features/notifications/model/notification_model.dart';

abstract class NotificationState {}

class NotificationStateInitial extends NotificationState {}

class NotificationStateLoading extends NotificationState {}

class NotificationStateFailure extends NotificationState {
  NotificationStateFailure(this.message);
  final String message;
}

class NotificationStateSuccess extends NotificationState {
  NotificationStateSuccess(this.notificationModel);
  final NotificationModel notificationModel;
}
