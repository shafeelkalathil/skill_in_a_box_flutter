import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_question/english/english.dart';
part 'content.g.dart';

@JsonSerializable()
class Content {

  Content({
    required this.hindi,
    required this.english,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  English hindi;
  English english;

  Content copyWith({
    English? hindi,
    English? english,
  }) =>
      Content(
        hindi: hindi ?? this.hindi,
        english: english ?? this.english,
      );

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
