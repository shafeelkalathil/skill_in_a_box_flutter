// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => NotesModel(
      note: (json['note'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NotesModelToJson(NotesModel instance) =>
    <String, dynamic>{
      'note': instance.note,
    };

GetNotesModel _$GetNotesModelFromJson(Map<String, dynamic> json) =>
    GetNotesModel(
      lessonId: json['lessonId'] as String?,
      courseId: json['courseId'] as String?,
      sectionId: json['sectionId'] as String?,
    );

Map<String, dynamic> _$GetNotesModelToJson(GetNotesModel instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'courseId': instance.courseId,
      'sectionId': instance.sectionId,
    };

SaveNoteModel _$SaveNoteModelFromJson(Map<String, dynamic> json) =>
    SaveNoteModel(
      courseId: json['courseId'] as String?,
      sectionId: json['sectionId'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$SaveNoteModelToJson(SaveNoteModel instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'sectionId': instance.sectionId,
      'note': instance.note,
    };

UpdateNoteModel _$UpdateNoteModelFromJson(Map<String, dynamic> json) =>
    UpdateNoteModel(
      courseId: json['courseId'] as String?,
      sectionId: json['sectionId'] as String?,
      note: (json['note'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateNoteModelToJson(UpdateNoteModel instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'sectionId': instance.sectionId,
      'note': instance.note,
    };
