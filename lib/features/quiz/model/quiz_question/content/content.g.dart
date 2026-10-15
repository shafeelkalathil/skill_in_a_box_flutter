// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      hindi: English.fromJson(json['hindi'] as Map<String, dynamic>),
      english: English.fromJson(json['english'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'hindi': instance.hindi,
      'english': instance.english,
    };
