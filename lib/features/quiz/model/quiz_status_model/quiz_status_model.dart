
import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_status_model.g.dart';

@JsonSerializable()
class QuizStatusModel {

  QuizStatusModel({
    this.quizData,
    this.status,
  });

  factory QuizStatusModel.fromJson(Map<String, dynamic> json) =>
      _$QuizStatusModelFromJson(json);
  QuizData? quizData;
  String? status;

  QuizStatusModel copyWith({
    QuizData? quizData,
    String? status,
  }) =>
      QuizStatusModel(
        quizData: quizData ?? this.quizData,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() =>
      _$QuizStatusModelToJson(this);
}

@JsonSerializable()
class QuizData {

  QuizData({
    this.id,
    this.name,
    this.totalMark,
    this.totalQuestions,
    this.passMark,
    this.duration,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) =>
      _$QuizDataFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? name;
  int? totalMark;
  int? totalQuestions;
  int? passMark;
  int? duration;

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

  Map<String, dynamic> toJson() =>
      _$QuizDataToJson(this);
}
