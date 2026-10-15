import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_data.g.dart';
@JsonSerializable()
class QuizData {

  QuizData({
    required this.id,
    required this.name,
    required this.totalMark,
    required this.totalQuestions,
    required this.passMark,
    required this.duration,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) =>
      _$QuizDataFromJson(json);

  @JsonKey(name: '_id')
  String id;
  String name;
  int totalMark;
  int totalQuestions;
  int passMark;
  int duration;

  QuizData copyWith({
    String? id,
    String? name,
    int? totalMark,
    int? totalQuestions,
    int? passMark,
    int? duration,
  }) =>
      QuizData(
        id: id ?? this.id,
        name: name ?? this.name,
        totalMark: totalMark ?? this.totalMark,
        totalQuestions: totalQuestions ?? this.totalQuestions,
        passMark: passMark ?? this.passMark,
        duration: duration ?? this.duration,
      );

  Map<String, dynamic> toJson() => _$QuizDataToJson(this);
}
