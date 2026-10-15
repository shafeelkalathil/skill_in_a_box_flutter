import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/quiz/repositories/quiz_summary_repositories.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_state.dart';

final quizSummaryViewModelNotifier =
StateNotifierProvider<QuizSummaryViewModel, QuizSummaryState>(
      (ref) => QuizSummaryViewModel(ref.read(quizSummaryRepositoryProvider)),
);


class QuizSummaryViewModel extends StateNotifier<QuizSummaryState> {
  QuizSummaryViewModel(this.quizSummaryRepository)
      : super(QuizSummaryInitial());

  final QuizSummaryRepository quizSummaryRepository;

  Future<void> getQuizSummary({
    required QuizBodyParams quizSummaryParams,}) async {
    state = QuizSummaryLoading();
    final result = await quizSummaryRepository.getQuizSummary(
      quizSummaryParams: quizSummaryParams,
    );
    result.fold((errorMessage) {
      state = QuizSummaryFailure(errorMessage,);
    },(quizSummaryModel) {
      state = QuizSummarySuccess(quizSummaryModel);
    },
    );
  }

}
