// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyEventsModel _$MyEventsModelFromJson(Map<String, dynamic> json) =>
    MyEventsModel(
      event: (json['event'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyEventsModelToJson(MyEventsModel instance) =>
    <String, dynamic>{
      'event': instance.event,
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
      eventHostDetails: json['eventHostDetails'] == null
          ? null
          : EventHostDetails.fromJson(
              json['eventHostDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'status': instance.status,
      'eventHostDetails': instance.eventHostDetails,
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

EventHostDetails _$EventHostDetailsFromJson(Map<String, dynamic> json) =>
    EventHostDetails(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$EventHostDetailsToJson(EventHostDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePic': instance.profilePic,
    };
