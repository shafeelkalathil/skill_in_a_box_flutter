
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_data_model/course_extend_data_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_validity_model.dart';

abstract class CourseSettingsState {}

class CourseSettingsInitial extends CourseSettingsState {}

class CourseExtendDataLoading extends CourseSettingsState {}

class CourseExtendDataFailure extends CourseSettingsState {
  CourseExtendDataFailure(this.message);
  final String message;
}

class CourseExtendDataSuccess extends CourseSettingsState {
  CourseExtendDataSuccess(this.courseExtendDataModel);
  final CourseExtendDataModel courseExtendDataModel;
}

class CourseSettingsLoading extends CourseSettingsState {}

class CourseSettingsFailure extends CourseSettingsState {
  CourseSettingsFailure(this.message);
  final String message;
}

class CourseSettingsSuccess extends CourseSettingsState {
  CourseSettingsSuccess(this.courseExtendValidityModel);
  final CourseExtendValidityModel courseExtendValidityModel;
}
