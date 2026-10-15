import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/start_quiz_model/start_quiz_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/repositories/quiz_overview_repositories.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_overview/quiz_overview_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';

final quizOverviewViewModelNotifier =
StateNotifierProvider<QuizOverviewViewModel, QuizOverviewState>(
      (ref) => QuizOverviewViewModel(ref.read(quizOverviewRepositoryProvider)),
);


class QuizOverviewViewModel extends StateNotifier<QuizOverviewState> {
  QuizOverviewViewModel(this.quizOverviewRepository)
      : super(QuizOverviewInitial());

  final QuizOverviewRepository quizOverviewRepository;

  Future<Either<String, StartQuizModel>> startQuiz({
    required QuizBodyParams quizSummaryParams,
  }) async {
    state = QuizOverviewLoading();

    final result = await quizOverviewRepository.startQuiz(
      quizSummaryParams: quizSummaryParams,
    );

    result.fold((errorMessage) {
        state = QuizOverviewFailure(errorMessage);
      }, (startQuizModel) {
        state = QuizOverviewSuccess(startQuizModel.message);
      },
    );
    return result;
  }

  Future<void> getQuizOverview({
    required QuizBodyParams quizBodyParams,}) async {

    state = GetQuizOverviewLoading();
    final result = await quizOverviewRepository
        .getQuizOverview(quizSummaryParams: quizBodyParams );

    result.fold((errorMessage) {
      state = GetQuizOverviewFailure(errorMessage);
    }, (quizOverviewModel) {
      state = GetQuizOverviewSuccess(quizOverviewModel);
    },
    );
  }

}
