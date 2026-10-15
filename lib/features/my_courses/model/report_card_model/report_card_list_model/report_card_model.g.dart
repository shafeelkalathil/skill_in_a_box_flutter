// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportCardModel _$ReportCardModelFromJson(Map<String, dynamic> json) =>
    ReportCardModel(
      reportCard: (json['reportCard'] as List<dynamic>?)
          ?.map((e) => ReportCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportCardModelToJson(ReportCardModel instance) =>
    <String, dynamic>{
      'reportCard': instance.reportCard,
    };

ReportCard _$ReportCardFromJson(Map<String, dynamic> json) => ReportCard(
      id: json['_id'] as String?,
      reportDate: json['reportDate'] as String?,
      sectionId: json['sectionId'] as String?,
    );

Map<String, dynamic> _$ReportCardToJson(ReportCard instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'reportDate': instance.reportDate,
      'sectionId': instance.sectionId,
    };
