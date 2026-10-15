// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveQuestionModel _$SaveQuestionModelFromJson(Map<String, dynamic> json) =>
    SaveQuestionModel(
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SaveQuestionModelToJson(SaveQuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
    };
