import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_submission_model.g.dart';

@JsonSerializable()
class ExamSubmissionModel {

  ExamSubmissionModel({
    required this.exam,
  });

  factory ExamSubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$ExamSubmissionModelFromJson(json);
  Exam exam;

  ExamSubmissionModel copyWith({
    Exam? exam,
  }) =>
      ExamSubmissionModel(
        exam: exam ?? this.exam,
      );

  Map<String, dynamic> toJson() => _$ExamSubmissionModelToJson(this);
}

@JsonSerializable()
class Exam {

  Exam({
    required this.id,
    required this.status,
    required this.timeTaken,
    required this.submittedTime,
    required this.obtainedMark,
    required this.name,
    required this.totalMark,
    required this.studentId,
    required this.studentName,
    required this.studentProfilePic,
    required this.feedback,
    required this.result,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  @JsonKey(name: '_id')
  String id;
  String status;
  int timeTaken;
  String submittedTime;
  int obtainedMark;
  String name;
  int totalMark;
  String studentId;
  String studentName;
  String studentProfilePic;
  String feedback;
  List<Result> result;

  Exam copyWith({
    String? id,
    String? status,
    int? timeTaken,
    String? submittedTime,
    int? obtainedMark,
    String? name,
    int? totalMark,
    String? studentId,
    String? studentName,
    String? studentProfilePic,
    String? feedback,
    List<Result>? result,
  }) =>
      Exam(
        id: id ?? this.id,
        status: status ?? this.status,
        timeTaken: timeTaken ?? this.timeTaken,
        submittedTime: submittedTime ?? this.submittedTime,
        obtainedMark: obtainedMark ?? this.obtainedMark,
        name: name ?? this.name,
        totalMark: totalMark ?? this.totalMark,
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        studentProfilePic: studentProfilePic ?? this.studentProfilePic,
        feedback: feedback ?? this.feedback,
        result: result ?? this.result,
      );

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}

@JsonSerializable()
class Result {

  Result({
    required this.question,
    required this.answer,
    required this.options,
    required this.type,
    required this.id,
    required this.questionScore,
    this.submittedAnswer,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  String question;
  List<String> answer;
  List<String>? submittedAnswer;
  List<Option> options;
  String type;
  @JsonKey(name: '_id')
  String id;
  int questionScore;

  Result copyWith({
    String? question,
    List<String>? answer,
    List<String>? submittedAnswer,
    List<Option>? options,
    String? type,
    String? id,
    int? questionScore,
  }) =>
      Result(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        submittedAnswer: submittedAnswer ?? this.submittedAnswer,
        options: options ?? this.options,
        type: type ?? this.type,
        id: id ?? this.id,
        questionScore: questionScore ?? this.questionScore,
      );

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Option {

  Option({
    required this.option,
    required this.id,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  String option;
  String id;

  Option copyWith({
    String? option,
    String? id,
  }) =>
      Option(
        option: option ?? this.option,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
