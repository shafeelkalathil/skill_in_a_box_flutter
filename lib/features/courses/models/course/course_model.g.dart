// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      course: (json['course'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: (json['totalDocuments'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'course': instance.course,
      'totalDocuments': instance.totalDocuments,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['_id'] as String?,
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      courseFee: (json['courseFee'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      duration: json['duration'] as String?,
      categoryDetails: json['categoryDetails'] == null
          ? null
          : CategoryDetails.fromJson(
              json['categoryDetails'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      '_id': instance.id,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'description': instance.description,
      'courseFee': instance.courseFee,
      'discount': instance.discount,
      'duration': instance.duration,
      'categoryDetails': instance.categoryDetails,
      'type': instance.type,
    };

CategoryDetails _$CategoryDetailsFromJson(Map<String, dynamic> json) =>
    CategoryDetails(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CategoryDetailsToJson(CategoryDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
