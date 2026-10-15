// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignmentModel _$AssignmentModelFromJson(Map<String, dynamic> json) =>
    AssignmentModel(
      assignment: json['assignment'] == null
          ? null
          : Assignment.fromJson(json['assignment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignmentModelToJson(AssignmentModel instance) =>
    <String, dynamic>{
      'assignment': instance.assignment,
    };

Assignment _$AssignmentFromJson(Map<String, dynamic> json) => Assignment(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      totalMark: (json['totalMark'] as num?)?.toInt(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      dueDays: json['dueDays'] as String?,
      status: json['status'] as String?,
      graded: json['graded'] as bool?,
      submittedData: json['submittedData'] == null
          ? null
          : SubmittedData.fromJson(
              json['submittedData'] as Map<String, dynamic>),
      previousSubmit: json['previousSubmit'] == null
          ? null
          : SubmittedData.fromJson(
              json['previousSubmit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'totalMark': instance.totalMark,
      'attachments': instance.attachments,
      'dueDays': instance.dueDays,
      'status': instance.status,
      'graded': instance.graded,
      'submittedData': instance.submittedData,
      'previousSubmit': instance.previousSubmit,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      hindi: json['hindi'] == null
          ? null
          : Language.fromJson(json['hindi'] as Map<String, dynamic>),
      english: json['english'] == null
          ? null
          : Language.fromJson(json['english'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'hindi': instance.hindi,
      'english': instance.english,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      question: json['question'] as String?,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'question': instance.question,
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'id': instance.id,
    };

SubmittedData _$SubmittedDataFromJson(Map<String, dynamic> json) =>
    SubmittedData(
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => Files.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String?,
      feedback: json['feedback'] as String?,
      mark: (json['mark'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubmittedDataToJson(SubmittedData instance) =>
    <String, dynamic>{
      'files': instance.files,
      'date': instance.date,
      'feedback': instance.feedback,
      'mark': instance.mark,
    };

Files _$FilesFromJson(Map<String, dynamic> json) => Files(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FilesToJson(Files instance) => <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'id': instance.id,
    };
