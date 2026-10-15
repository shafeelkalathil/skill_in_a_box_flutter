
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary/summary/summary.dart';
part 'quiz_summary_model.g.dart';
@JsonSerializable()
class QuizSummaryModel {

  QuizSummaryModel({
    required this.summary,
  });

  factory QuizSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSummaryModelFromJson(json);
  Summary summary;

  QuizSummaryModel copyWith({
    Summary? summary,
  }) =>
      QuizSummaryModel(
        summary: summary ?? this.summary,
      );

  Map<String, dynamic> toJson() => _$QuizSummaryModelToJson(this);
}
