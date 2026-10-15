// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mux_asset_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuxAssetByIdModel _$MuxAssetByIdModelFromJson(Map<String, dynamic> json) =>
    MuxAssetByIdModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MuxAssetByIdModelToJson(MuxAssetByIdModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      videoQuality: json['video_quality'] as String?,
      uploadId: json['upload_id'] as String?,
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      resolutionTier: json['resolution_tier'] as String?,
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress'] as Map<String, dynamic>),
      playbackIds: (json['playback_ids'] as List<dynamic>?)
          ?.map((e) => PlaybackId.fromJson(e as Map<String, dynamic>))
          .toList(),
      mp4Support: json['mp4_support'] as String?,
      maxStoredResolution: json['max_stored_resolution'] as String?,
      maxStoredFrameRate: (json['max_stored_frame_rate'] as num?)?.toInt(),
      maxResolutionTier: json['max_resolution_tier'] as String?,
      masterAccess: json['master_access'] as String?,
      ingestType: json['ingest_type'] as String?,
      id: json['id'] as String?,
      encodingTier: json['encoding_tier'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
      aspectRatio: json['aspect_ratio'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'video_quality': instance.videoQuality,
      'upload_id': instance.uploadId,
      'tracks': instance.tracks,
      'status': instance.status,
      'resolution_tier': instance.resolutionTier,
      'progress': instance.progress,
      'playback_ids': instance.playbackIds,
      'mp4_support': instance.mp4Support,
      'max_stored_resolution': instance.maxStoredResolution,
      'max_stored_frame_rate': instance.maxStoredFrameRate,
      'max_resolution_tier': instance.maxResolutionTier,
      'master_access': instance.masterAccess,
      'ingest_type': instance.ingestType,
      'id': instance.id,
      'encoding_tier': instance.encodingTier,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'aspect_ratio': instance.aspectRatio,
    };

PlaybackId _$PlaybackIdFromJson(Map<String, dynamic> json) => PlaybackId(
      policy: json['policy'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PlaybackIdToJson(PlaybackId instance) =>
    <String, dynamic>{
      'policy': instance.policy,
      'id': instance.id,
    };

Progress _$ProgressFromJson(Map<String, dynamic> json) => Progress(
      state: json['state'] as String?,
    );

Map<String, dynamic> _$ProgressToJson(Progress instance) => <String, dynamic>{
      'state': instance.state,
    };

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      type: json['type'] as String?,
      maxWidth: (json['max_width'] as num?)?.toInt(),
      maxHeight: (json['max_height'] as num?)?.toInt(),
      maxFrameRate: (json['max_frame_rate'] as num?)?.toInt(),
      id: json['id'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      status: json['status'] as String?,
      primary: json['primary'] as bool?,
      name: json['name'] as String?,
      maxChannels: (json['max_channels'] as num?)?.toInt(),
      languageCode: json['language_code'] as String?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'type': instance.type,
      'max_width': instance.maxWidth,
      'max_height': instance.maxHeight,
      'max_frame_rate': instance.maxFrameRate,
      'id': instance.id,
      'duration': instance.duration,
      'status': instance.status,
      'primary': instance.primary,
      'name': instance.name,
      'max_channels': instance.maxChannels,
      'language_code': instance.languageCode,
    };
