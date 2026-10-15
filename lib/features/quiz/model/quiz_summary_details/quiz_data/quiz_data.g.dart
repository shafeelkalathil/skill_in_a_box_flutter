// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizData _$QuizDataFromJson(Map<String, dynamic> json) => QuizData(
      quizName: json['quizName'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDataToJson(QuizData instance) => <String, dynamic>{
      'quizName': instance.quizName,
      'data': instance.data,
    };
