// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadResponseModel _$UploadResponseModelFromJson(Map<String, dynamic> json) =>
    UploadResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UploadResponseModelToJson(
        UploadResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'url': instance.url,
    };
