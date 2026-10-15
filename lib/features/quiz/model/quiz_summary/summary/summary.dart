import 'package:freezed_annotation/freezed_annotation.dart';
part 'summary.g.dart';
@JsonSerializable()
class Summary {

  Summary({
    required this.totalQuestions,
    required this.totalMarks,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.markObtained,
    required this.timeTaken,
    required this.showAnswer,
  });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
  int totalQuestions;
  int totalMarks;
  int correctAnswers;
  int incorrectAnswers;
  int markObtained;
  int timeTaken;
  bool showAnswer;

  Summary copyWith({
    int? totalQuestions,
    int? totalMarks,
    int? correctAnswers,
    int? incorrectAnswers,
    int? markObtained,
    int? timeTaken,
    bool? showAnswer,
  }) =>
      Summary(
        totalQuestions: totalQuestions ?? this.totalQuestions,
        totalMarks: totalMarks ?? this.totalMarks,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        markObtained: markObtained ?? this.markObtained,
        timeTaken: timeTaken ?? this.timeTaken,
        showAnswer: showAnswer ?? this.showAnswer,
      );

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
