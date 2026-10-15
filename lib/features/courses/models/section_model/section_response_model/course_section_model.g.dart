// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSectionModel _$CourseSectionModelFromJson(Map<String, dynamic> json) =>
    CourseSectionModel(
      lessonArray: (json['lessonArray'] as List<dynamic>?)
          ?.map((e) => LessonArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignmentArray: (json['assignmentArray'] as List<dynamic>?)
          ?.map((e) => AssignmentArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      quizArray: (json['quizArray'] as List<dynamic>?)
          ?.map((e) => QuizArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderArray: (json['orderArray'] as List<dynamic>?)
          ?.map((e) => OrderArray.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseSectionModelToJson(CourseSectionModel instance) =>
    <String, dynamic>{
      'lessonArray': instance.lessonArray,
      'assignmentArray': instance.assignmentArray,
      'quizArray': instance.quizArray,
      'orderArray': instance.orderArray,
    };

LessonArray _$LessonArrayFromJson(Map<String, dynamic> json) => LessonArray(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$LessonArrayToJson(LessonArray instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'title': instance.title,
    };

AssignmentArray _$AssignmentArrayFromJson(Map<String, dynamic> json) =>
    AssignmentArray(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$AssignmentArrayToJson(AssignmentArray instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

QuizArray _$QuizArrayFromJson(Map<String, dynamic> json) => QuizArray(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$QuizArrayToJson(QuizArray instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

OrderArray _$OrderArrayFromJson(Map<String, dynamic> json) => OrderArray(
      type: json['type'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$OrderArrayToJson(OrderArray instance) =>
    <String, dynamic>{
      'type': instance.type,
      'Id': instance.id,
    };
