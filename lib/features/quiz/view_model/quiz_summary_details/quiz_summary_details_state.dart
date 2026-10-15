
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary_details/quiz_summary_details_model.dart';

abstract class QuizSummaryDetailsState {}

class QuizSummaryDetailsInitial extends QuizSummaryDetailsState {}

class QuizSummaryDetailsLoading extends QuizSummaryDetailsState {}

class QuizSummaryDetailsFailure extends QuizSummaryDetailsState {
  QuizSummaryDetailsFailure(this.message);
  final String message;
}

class QuizSummaryDetailsSuccess extends QuizSummaryDetailsState {
  QuizSummaryDetailsSuccess(this.quizSummaryDetailsModel);
  final QuizSummaryDetailsModel quizSummaryDetailsModel;
}
