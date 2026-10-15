
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_question/quiz_question_model.dart';

abstract class QuizQuestionState {}

class QuizQuestionInitial extends QuizQuestionState {}

class QuizQuestionLoading extends QuizQuestionState {}

class QuizQuestionFailure extends QuizQuestionState {
  QuizQuestionFailure(this.message);
  final String message;
}

class QuizQuestionSuccess extends QuizQuestionState {
  QuizQuestionSuccess(this.quizQuestionModel);
  final QuizQuestionModel quizQuestionModel;
}

class SubmitQuizLoading extends QuizQuestionState {}

class SubmitQuizFailure extends QuizQuestionState {
  SubmitQuizFailure(this.message);
  final String message;
}

class SubmitQuizSuccess extends QuizQuestionState {
  SubmitQuizSuccess(this.successData);
  final Map<String,dynamic> successData;
}
