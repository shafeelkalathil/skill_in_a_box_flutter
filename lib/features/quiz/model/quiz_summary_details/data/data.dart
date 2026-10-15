import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary_details/options/options.dart';
part 'data.g.dart';

@JsonSerializable()
class Datum {

  Datum({
    required this.question,
    required this.options,
    required this.answer,
    this.submittedAnswer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
  String question;
  List<Option> options;
  List<String> answer;
  List<String>? submittedAnswer;

  Datum copyWith({
    String? question,
    List<Option>? options,
    List<String>? answer,
    List<String>? submittedAnswer,
  }) =>
      Datum(
        question: question ?? this.question,
        options: options ?? this.options,
        answer: answer ?? this.answer,
        submittedAnswer: submittedAnswer ?? this.submittedAnswer,
      );

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
