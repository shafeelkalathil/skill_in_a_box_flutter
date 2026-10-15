import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:skill_in_a_box_flutter/features/quiz/model/quiz_summary_details/data/data.dart';
part 'quiz_data.g.dart';

@JsonSerializable()
class QuizData {

  QuizData({
    required this.quizName,
    required this.data,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) =>
      _$QuizDataFromJson(json);
  String quizName;
  List<Datum> data;

  QuizData copyWith({
    String? quizName,
    List<Datum>? data,
  }) =>
      QuizData(
        quizName: quizName ?? this.quizName,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => _$QuizDataToJson(this);
}
