
import 'package:skill_in_a_box_flutter/features/my_courses/model/quiz_status_model/quiz_status_model.dart';


abstract class QuizStatusState {}

class QuizStatusStateInitial extends QuizStatusState {}

class QuizStatusStateLoading extends QuizStatusState {}

class QuizStatusStateFailure extends QuizStatusState {
  QuizStatusStateFailure(this.message);
  final String message;
}

class QuizStatusStateSuccess extends QuizStatusState {
  QuizStatusStateSuccess(this.quizStatusModel);
  final QuizStatusModel quizStatusModel;
}
