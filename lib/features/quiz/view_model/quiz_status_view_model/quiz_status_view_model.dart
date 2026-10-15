import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/quiz_status_model/quiz_status_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/start_quiz_model/start_quiz_model.dart';
import 'package:skill_in_a_box_flutter/features/quiz/repositories/quiz_overview_repositories.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_overview/quiz_overview_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_status_view_model/quiz_status_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/quiz_summary/quiz_summary_body.dart';

final quizStatusViewModelNotifier =
StateNotifierProvider<QuizStatusViewModel, QuizStatusState>(
      (ref) => QuizStatusViewModel(ref.read(quizOverviewRepositoryProvider)),
);


class QuizStatusViewModel extends StateNotifier<QuizStatusState> {
  QuizStatusViewModel(this.quizOverviewRepository)
      : super(QuizStatusStateInitial());

  final QuizOverviewRepository quizOverviewRepository;

  Future<Either<String, QuizStatusModel>> getQuizStatus({
    required QuizBodyParams quizSummaryParams,
  }) async {
    state = QuizStatusStateLoading();

    final result = await quizOverviewRepository.getQuizStatus(
      quizSummaryParams: quizSummaryParams,
    );

    result.fold((errorMessage) {
      state = QuizStatusStateFailure(errorMessage);
    }, (startQuizModel) {
      state = QuizStatusStateSuccess(startQuizModel);
    },
    );
    return result;
  }

}
