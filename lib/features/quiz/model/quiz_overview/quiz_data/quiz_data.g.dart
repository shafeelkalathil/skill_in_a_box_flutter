// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizData _$QuizDataFromJson(Map<String, dynamic> json) => QuizData(
      id: json['_id'] as String,
      name: json['name'] as String,
      totalMark: (json['totalMark'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      passMark: (json['passMark'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$QuizDataToJson(QuizData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'totalMark': instance.totalMark,
      'totalQuestions': instance.totalQuestions,
      'passMark': instance.passMark,
      'duration': instance.duration,
    };
