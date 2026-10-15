// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubt_box_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubtBoxSectionModel _$DoubtBoxSectionModelFromJson(
        Map<String, dynamic> json) =>
    DoubtBoxSectionModel(
      sectionData: (json['sectionData'] as List<dynamic>?)
          ?.map((e) => SectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoubtBoxSectionModelToJson(
        DoubtBoxSectionModel instance) =>
    <String, dynamic>{
      'sectionData': instance.sectionData,
    };

SectionData _$SectionDataFromJson(Map<String, dynamic> json) => SectionData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$SectionDataToJson(SectionData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'sessionId': instance.sessionId,
    };
