// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
