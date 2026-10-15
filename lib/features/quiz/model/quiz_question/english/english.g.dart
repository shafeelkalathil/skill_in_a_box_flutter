// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'english.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
