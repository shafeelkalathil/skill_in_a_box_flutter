
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary/quiz_summary_model.dart';

abstract class QuizSummaryState {}

class QuizSummaryInitial extends QuizSummaryState {}

class QuizSummaryLoading extends QuizSummaryState {}

class QuizSummaryFailure extends QuizSummaryState {
  QuizSummaryFailure(this.message);
  final String message;
}

class QuizSummarySuccess extends QuizSummaryState {
  QuizSummarySuccess(this.quizSummaryModel);
  final QuizSummaryModel quizSummaryModel;
}
