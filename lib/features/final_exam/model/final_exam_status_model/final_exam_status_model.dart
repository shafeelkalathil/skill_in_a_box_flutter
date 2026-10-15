import 'package:freezed_annotation/freezed_annotation.dart';

part 'final_exam_status_model.g.dart';

@JsonSerializable()
class FinalExamStatusModel {

  FinalExamStatusModel({
    required this.examData,
    required this.status,
  });

  factory FinalExamStatusModel.fromJson(Map<String, dynamic> json) =>
      _$FinalExamStatusModelFromJson(json);
  ExamData examData;
  String status;

  FinalExamStatusModel copyWith({
    ExamData? examData,
    String? status,
  }) =>
      FinalExamStatusModel(
        examData: examData ?? this.examData,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() => _$FinalExamStatusModelToJson(this);
}

@JsonSerializable()
class ExamData {

  ExamData({
    required this.id,
    required this.name,
    required this.totalMark,
    required this.totalQuestions,
    required this.passMark,
    required this.duration,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) =>
      _$ExamDataFromJson(json);
  @JsonKey(name: '_id')
  String id;
  String name;
  int totalMark;
  int totalQuestions;
  int passMark;
  int duration;

  ExamData copyWith({
    String? id,
    String? name,
    int? totalMark,
    int? totalQuestions,
    int? passMark,
    int? duration,
  }) =>
      ExamData(
        id: id ?? this.id,
        name: name ?? this.name,
        totalMark: totalMark ?? this.totalMark,
        totalQuestions: totalQuestions ?? this.totalQuestions,
        passMark: passMark ?? this.passMark,
        duration: duration ?? this.duration,
      );

  Map<String, dynamic> toJson() => _$ExamDataToJson(this);
}
