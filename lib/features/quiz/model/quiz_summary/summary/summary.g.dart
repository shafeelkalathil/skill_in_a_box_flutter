// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      totalMarks: (json['totalMarks'] as num).toInt(),
      correctAnswers: (json['correctAnswers'] as num).toInt(),
      incorrectAnswers: (json['incorrectAnswers'] as num).toInt(),
      markObtained: (json['markObtained'] as num).toInt(),
      timeTaken: (json['timeTaken'] as num).toInt(),
      showAnswer: json['showAnswer'] as bool,
    );

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'totalQuestions': instance.totalQuestions,
      'totalMarks': instance.totalMarks,
      'correctAnswers': instance.correctAnswers,
      'incorrectAnswers': instance.incorrectAnswers,
      'markObtained': instance.markObtained,
      'timeTaken': instance.timeTaken,
      'showAnswer': instance.showAnswer,
    };
