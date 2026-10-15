// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledCourses _$EnrolledCoursesFromJson(Map<String, dynamic> json) =>
    EnrolledCourses(
      course: (json['course'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnrolledCoursesToJson(EnrolledCourses instance) =>
    <String, dynamic>{
      'course': instance.course,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['_id'] as String?,
      progress: (json['progress'] as num?)?.toInt(),
      status: json['status'] as String?,
      courseDetails: json['courseDetails'] == null
          ? null
          : CourseDetails.fromJson(
              json['courseDetails'] as Map<String, dynamic>),
      batchDetails: json['batchDetails'] == null
          ? null
          : BatchDetails.fromJson(json['batchDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      '_id': instance.id,
      'progress': instance.progress,
      'status': instance.status,
      'courseDetails': instance.courseDetails,
      'batchDetails': instance.batchDetails,
    };

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) =>
    CourseDetails(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };

BatchDetails _$BatchDetailsFromJson(Map<String, dynamic> json) => BatchDetails(
      id: json['_id'] as String?,
      batchId: json['batchId'] as String?,
    );

Map<String, dynamic> _$BatchDetailsToJson(BatchDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'batchId': instance.batchId,
    };
