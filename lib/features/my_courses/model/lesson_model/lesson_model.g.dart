// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel(
      lessonData: json['lessonData'] == null
          ? null
          : LessonData.fromJson(json['lessonData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      'lessonData': instance.lessonData,
    };

LessonData _$LessonDataFromJson(Map<String, dynamic> json) => LessonData(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      contents: json['contents'] == null
          ? null
          : Contents.fromJson(json['contents'] as Map<String, dynamic>),
      progress: (json['progress'] as num?)?.toInt(),
      isFinished: json['isFinished'] as bool?,
    );

Map<String, dynamic> _$LessonDataToJson(LessonData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'contents': instance.contents,
      'progress': instance.progress,
      'isFinished': instance.isFinished,
    };

Contents _$ContentsFromJson(Map<String, dynamic> json) => Contents(
      hindi: json['hindi'] == null
          ? null
          : Languague.fromJson(json['hindi'] as Map<String, dynamic>),
      english: json['english'] == null
          ? null
          : Languague.fromJson(json['english'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentsToJson(Contents instance) => <String, dynamic>{
      'hindi': instance.hindi,
      'english': instance.english,
    };

Languague _$LanguagueFromJson(Map<String, dynamic> json) => Languague(
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguagueToJson(Languague instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'content': instance.content,
      'resources': instance.resources,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'id': instance.id,
    };
