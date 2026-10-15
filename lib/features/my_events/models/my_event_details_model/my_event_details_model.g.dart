// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_event_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyEventDetailsModel _$MyEventDetailsModelFromJson(Map<String, dynamic> json) =>
    MyEventDetailsModel(
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyEventDetailsModelToJson(
        MyEventDetailsModel instance) =>
    <String, dynamic>{
      'event': instance.event,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      outcomes: (json['outcomes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      facilitatorIds: (json['facilitatorIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'requirements': instance.requirements,
      'outcomes': instance.outcomes,
      'facilitatorIds': instance.facilitatorIds,
      'status': instance.status,
    };
