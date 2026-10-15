// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'event': instance.event,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      type: json['type'] as String?,
      description: json['description'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      eventHost: (json['eventHost'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['category'] as String?,
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      outcomes: (json['outcomes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      facilitatorIds: (json['facilitatorIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      trailer: (json['trailer'] as List<dynamic>?)
          ?.map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      pricing: json['pricing'] == null
          ? null
          : Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      availability: json['availability'] == null
          ? null
          : Availability.fromJson(json['availability'] as Map<String, dynamic>),
      isKitRequired: json['isKitRequired'] as bool?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'type': instance.type,
      'description': instance.description,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'eventHost': instance.eventHost,
      'category': instance.category,
      'requirements': instance.requirements,
      'outcomes': instance.outcomes,
      'facilitatorIds': instance.facilitatorIds,
      'trailer': instance.trailer,
      'status': instance.status,
      'pricing': instance.pricing,
      'availability': instance.availability,
      'isKitRequired': instance.isKitRequired,
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

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
