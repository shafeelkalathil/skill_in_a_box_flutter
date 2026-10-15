
abstract class LessonProgressState {}

class LessonProgressStateInitial extends LessonProgressState {}

class LessonProgressStateLoading extends LessonProgressState {}

class LessonProgressStateFailure extends LessonProgressState {
  LessonProgressStateFailure(this.message);
  final String message;
}

class LessonProgressStateSuccess extends LessonProgressState {
  LessonProgressStateSuccess(this.data);
  final Map<String,dynamic> data;
}