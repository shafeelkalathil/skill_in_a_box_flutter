import 'package:freezed_annotation/freezed_annotation.dart';
part 'save_exam_answer_model.g.dart';
@JsonSerializable()
class SaveExamAnswerModel {

  SaveExamAnswerModel({
    required this.question,
  });

  factory SaveExamAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$SaveExamAnswerModelFromJson(json);
  Question question;

  SaveExamAnswerModel copyWith({
    Question? question,
  }) =>
      SaveExamAnswerModel(
        question: question ?? this.question,
      );

  Map<String, dynamic> toJson() => _$SaveExamAnswerModelToJson(this);
}

@JsonSerializable()
class Question {

  Question({
    required this.id,
    required this.type,
    required this.content,
    required this.submittedAnswer,
    required this.submittedLanguage,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  @JsonKey(name: '_id')
  String id;
  String type;
  Content content;
  List<String> submittedAnswer;
  String submittedLanguage;

  Question copyWith({
    String? id,
    String? type,
    Content? content,
    List<String>? submittedAnswer,
    String? submittedLanguage,
  }) =>
      Question(
        id: id ?? this.id,
        type: type ?? this.type,
        content: content ?? this.content,
        submittedAnswer: submittedAnswer ?? this.submittedAnswer,
        submittedLanguage: submittedLanguage ?? this.submittedLanguage,
      );

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Content {

  Content({
    required this.hindi,
    required this.english,
  });

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
  English hindi;
  English english;

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
    required this.question,
    required this.isMultipleAnswers,
    required this.options,
  });

  factory English.fromJson(Map<String, dynamic> json) => _$EnglishFromJson(json);
  String question;
  bool isMultipleAnswers;
  List<Option> options;

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

  factory Option.fromJson(Map<String, dynamic> json) =>
      _$OptionFromJson(json);
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
