
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/save_question/question/question.dart';
part 'save_question.g.dart';
@JsonSerializable()
class SaveQuestionModel {

  SaveQuestionModel({
    required this.question,
  });

  factory SaveQuestionModel.fromJson(Map<String, dynamic> json) => _$SaveQuestionModelFromJson(json);
  Question question;

  SaveQuestionModel copyWith({
    Question? question,
  }) =>
      SaveQuestionModel(
        question: question ?? this.question,
      );

  Map<String, dynamic> toJson() => _$SaveQuestionModelToJson(this);
}



