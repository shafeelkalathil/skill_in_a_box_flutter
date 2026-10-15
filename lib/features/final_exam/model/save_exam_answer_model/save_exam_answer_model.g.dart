// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_exam_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveExamAnswerModel _$SaveExamAnswerModelFromJson(Map<String, dynamic> json) =>
    SaveExamAnswerModel(
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SaveExamAnswerModelToJson(
        SaveExamAnswerModel instance) =>
    <String, dynamic>{
      'question': instance.question,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['_id'] as String,
      type: json['type'] as String,
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      submittedAnswer: (json['submittedAnswer'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      submittedLanguage: json['submittedLanguage'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'submittedAnswer': instance.submittedAnswer,
      'submittedLanguage': instance.submittedLanguage,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      hindi: English.fromJson(json['hindi'] as Map<String, dynamic>),
      english: English.fromJson(json['english'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'hindi': instance.hindi,
      'english': instance.english,
    };

English _$EnglishFromJson(Map<String, dynamic> json) => English(
      question: json['question'] as String,
      isMultipleAnswers: json['isMultipleAnswers'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnglishToJson(English instance) => <String, dynamic>{
      'question': instance.question,
      'isMultipleAnswers': instance.isMultipleAnswers,
      'options': instance.options,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      option: json['option'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'option': instance.option,
      'id': instance.id,
    };
