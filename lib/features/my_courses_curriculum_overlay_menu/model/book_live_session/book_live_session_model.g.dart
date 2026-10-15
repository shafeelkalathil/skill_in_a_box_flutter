// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_live_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookLiveSessionModel _$BookLiveSessionModelFromJson(
        Map<String, dynamic> json) =>
    BookLiveSessionModel(
      slot: (json['slot'] as List<dynamic>?)
          ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookLiveSessionModelToJson(
        BookLiveSessionModel instance) =>
    <String, dynamic>{
      'slot': instance.slot,
    };

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      id: json['_id'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      status: json['status'] as String?,
      isRequested: json['isRequested'] as bool?,
      requestsLength: (json['requestsLength'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      '_id': instance.id,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'status': instance.status,
      'isRequested': instance.isRequested,
      'requestsLength': instance.requestsLength,
    };
