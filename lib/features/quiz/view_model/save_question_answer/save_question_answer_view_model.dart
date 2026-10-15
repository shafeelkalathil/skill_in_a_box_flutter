import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/save_question_answer/save_question_answer_state.dart';
import 'package:skill_in_a_box_flutter/features/quiz/view_model/save_question_answer/save_question_body.dart';

import 'package:skill_in_a_box_flutter/features/quiz/repositories/quiz_question_repositories.dart';

final saveQuestionAnswerViewModelModelNotifier =
StateNotifierProvider<SaveQuestionAnswerViewModel, SaveQuestionAnswerState>(
      (ref) => SaveQuestionAnswerViewModel(ref.read(quizQuestionRepositoriesProvider)),
);


class SaveQuestionAnswerViewModel extends StateNotifier<SaveQuestionAnswerState> {
  SaveQuestionAnswerViewModel(this.quizQuestionRepositories)
      : super(SaveQuestionAnswerInitial());

  final QuizQuestionRepositories quizQuestionRepositories;

  Future<void> saveQuestionAnswer(
      {required SaveQuestionBody saveQuizBody,
        required int questionNo,}) async {
    state = SaveQuestionAnswerLoading();
    final result = await quizQuestionRepositories.saveQuestionAnswer(
        saveQuizBody: saveQuizBody,
        questionNo: questionNo,
    );
    result.fold((errorMessage) {
      state = SaveQuestionAnswerFailure(errorMessage,);
    },(saveQuestionModel) {
      state = SaveQuestionAnswerSuccess(saveQuestionModel);
    },
    );
  }

}
