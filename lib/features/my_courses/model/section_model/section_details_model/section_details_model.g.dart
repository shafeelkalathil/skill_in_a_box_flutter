// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionDetailsModel _$SectionDetailsModelFromJson(Map<String, dynamic> json) =>
    SectionDetailsModel(
      lessonArray: (json['lessonArray'] as List<dynamic>?)
          ?.map((e) => LessonArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignmentArray: (json['assignmentArray'] as List<dynamic>?)
          ?.map((e) => DetailsArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      quizArray: (json['quizArray'] as List<dynamic>?)
          ?.map((e) => DetailsArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderArray: (json['orderArray'] as List<dynamic>?)
          ?.map((e) => OrderArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentLesson: json['currentLesson'] as String?,
    );

Map<String, dynamic> _$SectionDetailsModelToJson(
        SectionDetailsModel instance) =>
    <String, dynamic>{
      'lessonArray': instance.lessonArray,
      'assignmentArray': instance.assignmentArray,
      'quizArray': instance.quizArray,
      'orderArray': instance.orderArray,
      'currentLesson': instance.currentLesson,
    };

LessonArray _$LessonArrayFromJson(Map<String, dynamic> json) => LessonArray(
      id: json['_id'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$LessonArrayToJson(LessonArray instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
    };

DetailsArray _$DetailsArrayFromJson(Map<String, dynamic> json) => DetailsArray(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$DetailsArrayToJson(DetailsArray instance) =>
    <String, dynamic>{
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
