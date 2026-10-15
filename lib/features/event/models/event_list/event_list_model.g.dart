// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventListModel _$EventListModelFromJson(Map<String, dynamic> json) =>
    EventListModel(
      event: (json['event'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: (json['totalDocuments'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EventListModelToJson(EventListModel instance) =>
    <String, dynamic>{
      'event': instance.event,
      'totalDocuments': instance.totalDocuments,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      pricing: json['pricing'] == null
          ? null
          : Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'status': instance.status,
      'type': instance.type,
      'pricing': instance.pricing,
      'description': instance.description,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'type': instance.type,
      'link': instance.link,
      'id': instance.id,
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      type: json['type'] as String?,
      eventPrice: (json['eventPrice'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'type': instance.type,
      'eventPrice': instance.eventPrice,
      'discountPrice': instance.discountPrice,
    };
