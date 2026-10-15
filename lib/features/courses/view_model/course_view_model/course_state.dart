import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseFailure extends CourseState {
  CourseFailure(this.message);
  final String message;
}

class CourseSuccess extends CourseState {
  CourseSuccess(this.message, this.overview);
  final String message;
  final CourseOverviewModel ? overview;
}
