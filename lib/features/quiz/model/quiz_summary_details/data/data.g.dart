// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      answer:
          (json['answer'] as List<dynamic>).map((e) => e as String).toList(),
      submittedAnswer: (json['submittedAnswer'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'answer': instance.answer,
      'submittedAnswer': instance.submittedAnswer,
    };
