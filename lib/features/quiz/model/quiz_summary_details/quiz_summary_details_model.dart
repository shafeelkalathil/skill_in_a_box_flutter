
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary_details/quiz_data/quiz_data.dart';
part 'quiz_summary_details_model.g.dart';

@JsonSerializable()
class QuizSummaryDetailsModel {

  QuizSummaryDetailsModel({
    required this.quizData,
  });

  factory QuizSummaryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSummaryDetailsModelFromJson(json);
  QuizData quizData;

  QuizSummaryDetailsModel copyWith({
    QuizData? quizData,
  }) =>
      QuizSummaryDetailsModel(
        quizData: quizData ?? this.quizData,
      );

  Map<String, dynamic> toJson() => _$QuizSummaryDetailsModelToJson(this);
}
