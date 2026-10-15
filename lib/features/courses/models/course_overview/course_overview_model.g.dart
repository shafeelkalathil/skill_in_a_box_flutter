// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseOverviewModel _$CourseOverviewModelFromJson(Map<String, dynamic> json) =>
    CourseOverviewModel(
      description: json['description'] as String?,
      courseOutput: (json['courseOutput'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requirement: (json['requirement'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      trailer: (json['trailer'] as List<dynamic>?)
          ?.map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      courseFee: (json['courseFee'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      lessons: (json['lessons'] as num?)?.toInt(),
      access: json['access'] as String?,
      title: json['title'] as String?,
      registrationAmount: (json['registrationAmount'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CourseOverviewModelToJson(
        CourseOverviewModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'courseOutput': instance.courseOutput,
      'requirement': instance.requirement,
      'trailer': instance.trailer,
      'thumbnail': instance.thumbnail,
      'courseFee': instance.courseFee,
      'discount': instance.discount,
      'lessons': instance.lessons,
      'access': instance.access,
      'title': instance.title,
      'registrationAmount': instance.registrationAmount,
      'type': instance.type,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'id': instance.id,
    };
