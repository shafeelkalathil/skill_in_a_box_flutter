
import 'package:skill_in_a_box_flutter/features/quiz/model/save_question/save_question.dart';

abstract class SaveQuestionAnswerState {}

class SaveQuestionAnswerInitial extends SaveQuestionAnswerState {}

class SaveQuestionAnswerLoading extends SaveQuestionAnswerState {}

class SaveQuestionAnswerFailure extends SaveQuestionAnswerState {
  SaveQuestionAnswerFailure(this.message);
  final String message;
}

class SaveQuestionAnswerSuccess extends SaveQuestionAnswerState {
  SaveQuestionAnswerSuccess(this.saveQuestionModel);
  final SaveQuestionModel saveQuestionModel;
}
