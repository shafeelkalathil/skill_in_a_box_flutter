// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineEventModel _$OnlineEventModelFromJson(Map<String, dynamic> json) =>
    OnlineEventModel(
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$OnlineEventModelToJson(OnlineEventModel instance) =>
    <String, dynamic>{
      'event': instance.event,
      'isSuccess': instance.isSuccess,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['_id'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      status: json['status'] as String?,
      liveSessionInfo: json['liveSessionInfo'] == null
          ? null
          : LiveSessionInfo.fromJson(
              json['liveSessionInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      '_id': instance.id,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'status': instance.status,
      'liveSessionInfo': instance.liveSessionInfo,
    };

LiveSessionInfo _$LiveSessionInfoFromJson(Map<String, dynamic> json) =>
    LiveSessionInfo(
      roomId: json['roomId'] as String?,
      guestCode: json['guestCode'] as String?,
      guestId: json['guestId'] as String?,
    );

Map<String, dynamic> _$LiveSessionInfoToJson(LiveSessionInfo instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'guestCode': instance.guestCode,
      'guestId': instance.guestId,
    };
