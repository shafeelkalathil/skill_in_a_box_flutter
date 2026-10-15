
import 'package:freezed_annotation/freezed_annotation.dart';
part 'final_exam_question_model.g.dart';
@JsonSerializable()
class FinalExamQuestionModel {

  FinalExamQuestionModel({
    required this.question,
    required this.totalQuestions,
  });

  factory FinalExamQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$FinalExamQuestionModelFromJson(json);
  Question question;
  int totalQuestions;

  FinalExamQuestionModel copyWith({
    Question? question,
    int? totalQuestions,
  }) =>
      FinalExamQuestionModel(
        question: question ?? this.question,
        totalQuestions: totalQuestions ?? this.totalQuestions,
      );

  Map<String, dynamic> toJson() => _$FinalExamQuestionModelToJson(this);
}

@JsonSerializable()
class Question {

  Question({
    required this.id,
    required this.type,
    required this.content,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  @JsonKey(name: '_id')
  String id;
  String type;
  Content content;

  Question copyWith({
    String? id,
    String? type,
    Content? content,
  }) =>
      Question(
        id: id ?? this.id,
        type: type ?? this.type,
        content: content ?? this.content,
      );

  Map<String, dynamic> toJson() =>  _$QuestionToJson(this);
}

@JsonSerializable()
class Content {

  Content({
    this.hindi,
    this.english,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  English? hindi;
  English? english;

  Content copyWith({
    English? hindi,
    English? english,
  }) =>
      Content(
        hindi: hindi ?? this.hindi,
        english: english ?? this.english,
      );

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class English {

  English({
    this.question,
    this.isMultipleAnswers,
    this.options,
  });

  factory English.fromJson(Map<String, dynamic> json) =>
      _$EnglishFromJson(json);
  String? question;
  bool? isMultipleAnswers;
  List<Option>? options;

  English copyWith({
    String? question,
    bool? isMultipleAnswers,
    List<Option>? options,
  }) =>
      English(
        question: question ?? this.question,
        isMultipleAnswers: isMultipleAnswers ?? this.isMultipleAnswers,
        options: options ?? this.options,
      );

  Map<String, dynamic> toJson() => _$EnglishToJson(this);
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
