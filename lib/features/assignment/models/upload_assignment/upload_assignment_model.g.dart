// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_assignment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAssignmentModel _$UploadAssignmentModelFromJson(
        Map<String, dynamic> json) =>
    UploadAssignmentModel(
      assignmentId: json['assignmentId'] as String?,
      courseId: json['courseId'] as String?,
      type: json['type'] as String?,
      sectionId: json['sectionId'] as String?,
      submissionData: json['submissionData'] == null
          ? null
          : SubmissionData.fromJson(
              json['submissionData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadAssignmentModelToJson(
        UploadAssignmentModel instance) =>
    <String, dynamic>{
      'assignmentId': instance.assignmentId,
      'courseId': instance.courseId,
      'type': instance.type,
      'sectionId': instance.sectionId,
      'submissionData': instance.submissionData,
    };

SubmissionData _$SubmissionDataFromJson(Map<String, dynamic> json) =>
    SubmissionData(
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => Files.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$SubmissionDataToJson(SubmissionData instance) =>
    <String, dynamic>{
      'files': instance.files,
      'date': instance.date,
    };

Files _$FilesFromJson(Map<String, dynamic> json) => Files(
      name: json['name'] as String?,
      type: json['type'] as String?,
      link: json['link'] as String?,
      size: (json['size'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FilesToJson(Files instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'link': instance.link,
      'size': instance.size,
      'id': instance.id,
    };
