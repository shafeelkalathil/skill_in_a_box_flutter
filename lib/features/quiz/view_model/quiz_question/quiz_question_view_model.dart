import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/quiz/repositories/quiz_question_repositories.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_question/quiz_question_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';

final quizQuestionViewModelModelNotifier =
StateNotifierProvider<QuizQuestionViewModel, QuizQuestionState>(
      (ref) => QuizQuestionViewModel(
          ref.read(quizQuestionRepositoriesProvider),),
);

class QuizQuestionViewModel extends StateNotifier<QuizQuestionState> {
  QuizQuestionViewModel(this.quizQuestionRepositories)
      : super(QuizQuestionInitial());

  final QuizQuestionRepositories quizQuestionRepositories;

  Future<void> getQuizQuestion({
    required QuizBodyParams quizSummaryParams,
    required int questionNo,
  }) async {
    state = QuizQuestionLoading();
    final result = await quizQuestionRepositories.getQuizQuestion(
      quizSummaryParams: quizSummaryParams,
      questionNo: questionNo,
    );
    result.fold((errorMessage) {
      state = QuizQuestionFailure(errorMessage,);
    },(quizQuestionModel) {
      state = QuizQuestionSuccess(quizQuestionModel);
    },
    );
  }

  Future<void> submitQuiz({
    required QuizBodyParams quizSummaryParams,
  }) async {
    state = SubmitQuizLoading();
    final result = await quizQuestionRepositories.submitQuiz(
      quizSummaryParams: quizSummaryParams,);
    result.fold((errorMessage) {
      state = SubmitQuizFailure(errorMessage,);
    },(quizQuestionModel) {
      state = SubmitQuizSuccess(quizQuestionModel);
    },
    );
  }




}
