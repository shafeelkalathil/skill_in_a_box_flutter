

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_question/question/question.dart';
part 'quiz_question_model.g.dart';

@JsonSerializable()
class QuizQuestionModel {

  QuizQuestionModel({
    required this.question,
    required this.totalQuestions,
  });

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionModelFromJson(json);
  Question question;
  int totalQuestions;

  QuizQuestionModel copyWith({
    Question? question,
    int? totalQuestions,
  }) =>
      QuizQuestionModel(
        question: question ?? this.question,
        totalQuestions: totalQuestions ?? this.totalQuestions,
      );

  Map<String, dynamic> toJson() => _$QuizQuestionModelToJson(this);
}
