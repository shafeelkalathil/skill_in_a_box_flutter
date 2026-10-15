// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingModel _$RecordingModelFromJson(Map<String, dynamic> json) =>
    RecordingModel(
      recording: (json['recording'] as List<dynamic>?)
          ?.map((e) => Recording.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecordingModelToJson(RecordingModel instance) =>
    <String, dynamic>{
      'recording': instance.recording,
    };

Recording _$RecordingFromJson(Map<String, dynamic> json) => Recording(
      id: json['_id'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
    );

Map<String, dynamic> _$RecordingToJson(Recording instance) => <String, dynamic>{
      '_id': instance.id,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
    };
