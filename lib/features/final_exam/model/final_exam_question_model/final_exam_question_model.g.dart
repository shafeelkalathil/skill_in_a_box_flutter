// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_exam_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalExamQuestionModel _$FinalExamQuestionModelFromJson(
        Map<String, dynamic> json) =>
    FinalExamQuestionModel(
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
    );

Map<String, dynamic> _$FinalExamQuestionModelToJson(
        FinalExamQuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'totalQuestions': instance.totalQuestions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['_id'] as String,
      type: json['type'] as String,
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      hindi: json['hindi'] == null
          ? null
          : English.fromJson(json['hindi'] as Map<String, dynamic>),
      english: json['english'] == null
          ? null
          : English.fromJson(json['english'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'hindi': instance.hindi,
      'english': instance.english,
    };

English _$EnglishFromJson(Map<String, dynamic> json) => English(
      question: json['question'] as String?,
      isMultipleAnswers: json['isMultipleAnswers'] as bool?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
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
