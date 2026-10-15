// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resubmit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResubmitRequestModel _$ResubmitRequestModelFromJson(
        Map<String, dynamic> json) =>
    ResubmitRequestModel(
      assignmentId: json['assignmentId'] as String?,
      sectionId: json['sectionId'] as String?,
      courseId: json['courseId'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ResubmitRequestModelToJson(
        ResubmitRequestModel instance) =>
    <String, dynamic>{
      'assignmentId': instance.assignmentId,
      'sectionId': instance.sectionId,
      'courseId': instance.courseId,
      'type': instance.type,
    };
