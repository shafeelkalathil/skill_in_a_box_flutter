import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_overview/quiz_data/quiz_data.dart';
part 'quiz_overview_model.g.dart';

@JsonSerializable()
class QuizOverviewModel {

  QuizOverviewModel({
    required this.quizData,
  });

  factory QuizOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$QuizOverviewModelFromJson(json);
  QuizData quizData;

  QuizOverviewModel copyWith({
    QuizData? quizData,
  }) =>
      QuizOverviewModel(
        quizData: quizData ?? this.quizData,
      );

  Map<String, dynamic> toJson() => _$QuizOverviewModelToJson(this);
}
