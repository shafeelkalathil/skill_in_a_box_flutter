import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_question/options/options.dart';
part 'english.g.dart';
@JsonSerializable()
class English {

  English({
    required this.question,
    required this.isMultipleAnswers,
    required this.options,
  });

  factory English.fromJson(Map<String, dynamic> json) =>
      _$EnglishFromJson(json);
  String question;
  bool isMultipleAnswers;
  List<Option> options;

  English copyWith({
    String? question,
    bool? isMultipleAnswers,
    List<Option>? options,
  }) =>
      English(
        question: question ?? this.question,
        isMultipleAnswers: isMultipleAnswers ?? this.isMultipleAnswers,
        options: options ?? this.options,
      );

  Map<String, dynamic> toJson() => _$EnglishToJson(this);
}
