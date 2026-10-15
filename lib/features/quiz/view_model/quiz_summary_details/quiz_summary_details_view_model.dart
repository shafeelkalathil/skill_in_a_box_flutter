import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/quiz/repositories/quiz_summary_details_repositories.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary_details/quiz_summary_details_state.dart';

final quizSummaryDetailsViewModelNotifier =
StateNotifierProvider<QuizSummaryDetailsViewModel, QuizSummaryDetailsState>(
      (ref) => QuizSummaryDetailsViewModel
        (ref.read(quizSummaryDetailsRepositoryProvider)),
);


class QuizSummaryDetailsViewModel extends
StateNotifier<QuizSummaryDetailsState> {
  QuizSummaryDetailsViewModel(this.quizSummaryDetailsRepository)
      : super(QuizSummaryDetailsInitial());

  final QuizSummaryDetailsRepository quizSummaryDetailsRepository;

  Future<void> getQuizSummaryDetails({
    required QuizBodyParams quizSummaryParams,}) async {
    state = QuizSummaryDetailsLoading();
    final result = await quizSummaryDetailsRepository.getQuizSummaryDetails(
        quizSummaryParams: quizSummaryParams,
    );
    result.fold((errorMessage) {
      state = QuizSummaryDetailsFailure(errorMessage,);
    },(quizSummaryDetailsModel) {
      state = QuizSummaryDetailsSuccess(quizSummaryDetailsModel);
    },
    );
  }

}
