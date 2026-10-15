// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadModel _$FileUploadModelFromJson(Map<String, dynamic> json) =>
    FileUploadModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$FileUploadModelToJson(FileUploadModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'url': instance.url,
    };
