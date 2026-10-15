// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_exam_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalExamStatusModel _$FinalExamStatusModelFromJson(
        Map<String, dynamic> json) =>
    FinalExamStatusModel(
      examData: ExamData.fromJson(json['examData'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$FinalExamStatusModelToJson(
        FinalExamStatusModel instance) =>
    <String, dynamic>{
      'examData': instance.examData,
      'status': instance.status,
    };

ExamData _$ExamDataFromJson(Map<String, dynamic> json) => ExamData(
      id: json['_id'] as String,
      name: json['name'] as String,
      totalMark: (json['totalMark'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      passMark: (json['passMark'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$ExamDataToJson(ExamData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'totalMark': instance.totalMark,
      'totalQuestions': instance.totalQuestions,
      'passMark': instance.passMark,
      'duration': instance.duration,
    };
