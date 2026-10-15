import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_question/content/content.dart';
part 'question.g.dart';
@JsonSerializable()
class Question {

  Question({
    required this.id,
    required this.type,
    required this.content,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  @JsonKey(name: '_id')
  String id;
  String type;
  Content content;

  Question copyWith({
    String? id,
    String? type,
    Content? content,
  }) =>
      Question(
        id: id ?? this.id,
        type: type ?? this.type,
        content: content ?? this.content,
      );

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
