// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) =>
    CertificateModel(
      id: json['_id'] as String?,
      isCertified: json['isCertified'] as bool?,
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => Certificate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CertificateModelToJson(CertificateModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isCertified': instance.isCertified,
      'certificates': instance.certificates,
    };

Certificate _$CertificateFromJson(Map<String, dynamic> json) => Certificate(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      certificateId: json['certificateId'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'certificateId': instance.certificateId,
      'date': instance.date?.toIso8601String(),
      '_id': instance.id,
    };
