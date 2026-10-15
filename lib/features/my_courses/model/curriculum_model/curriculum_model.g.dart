// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurriculumModel _$CurriculumModelFromJson(Map<String, dynamic> json) =>
    CurriculumModel(
      curriculum: json['curriculum'] == null
          ? null
          : Curriculum.fromJson(json['curriculum'] as Map<String, dynamic>),
      currentSection: json['currentSection'] as String?,
      expiryDate: json['expiryDate'] as String?,
      finalExams: (json['finalExams'] as List<dynamic>?)
          ?.map((e) => FinalExam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurriculumModelToJson(CurriculumModel instance) =>
    <String, dynamic>{
      'curriculum': instance.curriculum,
      'currentSection': instance.currentSection,
      'expiryDate': instance.expiryDate,
      'finalExams': instance.finalExams,
    };

Curriculum _$CurriculumFromJson(Map<String, dynamic> json) => Curriculum(
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => Sections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurriculumToJson(Curriculum instance) =>
    <String, dynamic>{
      'sections': instance.sections,
    };

Sections _$SectionsFromJson(Map<String, dynamic> json) => Sections(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      lessonCount: (json['lessonCount'] as num?)?.toInt(),
      quizCount: (json['quizCount'] as num?)?.toInt(),
      assignmentCount: (json['assignmentCount'] as num?)?.toInt(),
      openingDate: json['openingDate'] as String?,
    );

Map<String, dynamic> _$SectionsToJson(Sections instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'lessonCount': instance.lessonCount,
      'quizCount': instance.quizCount,
      'assignmentCount': instance.assignmentCount,
      'openingDate': instance.openingDate,
    };

FinalExam _$FinalExamFromJson(Map<String, dynamic> json) => FinalExam(
      id: json['_id'] as String,
      name: json['name'] as String,
      startDateTime: DateTime.parse(json['startDateTime'] as String),
      isLocked: json['isLocked'] as bool,
    );

Map<String, dynamic> _$FinalExamToJson(FinalExam instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'startDateTime': instance.startDateTime.toIso8601String(),
      'isLocked': instance.isLocked,
    };
