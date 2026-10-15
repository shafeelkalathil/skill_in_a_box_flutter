import 'package:skill_in_a_box_flutter/features/my_courses/model/lesson_model/lesson_model.dart';

abstract class LessonState {}

class LessonStateInitial extends LessonState {}

class LessonStateLoading extends LessonState {}

class LessonStateFailure extends LessonState {
  LessonStateFailure(this.message);
  final String message;
}

class LessonStateSuccess extends LessonState {
  LessonStateSuccess(this.lessonModel);
  final LessonModel lessonModel;
}