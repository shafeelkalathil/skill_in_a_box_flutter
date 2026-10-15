
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/quiz_overview_model.dart';

abstract class QuizOverviewState {}

class QuizOverviewInitial extends QuizOverviewState {}

class QuizOverviewLoading extends QuizOverviewState {}

class QuizOverviewFailure extends QuizOverviewState {
  QuizOverviewFailure(this.message);
  final String message;
}

class QuizOverviewSuccess extends QuizOverviewState {
  QuizOverviewSuccess(this.message);
  final String message;
}

class GetQuizOverviewLoading extends QuizOverviewState {}

class GetQuizOverviewFailure extends QuizOverviewState {
  GetQuizOverviewFailure(this.message);
  final String message;
}

class GetQuizOverviewSuccess extends QuizOverviewState {
  GetQuizOverviewSuccess(this.quizOverviewModel);
  final QuizOverviewModel quizOverviewModel;
}
