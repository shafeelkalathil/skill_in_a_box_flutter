import 'package:freezed_annotation/freezed_annotation.dart';
part 'mux_asset_by_id_model.g.dart';
@JsonSerializable()
class MuxAssetByIdModel {

  MuxAssetByIdModel({
    this.data,
  });

  factory MuxAssetByIdModel.fromJson(Map<String, dynamic> json) =>
      _$MuxAssetByIdModelFromJson(json);
  Data? data;

  MuxAssetByIdModel copyWith({
    Data? data,
  }) =>
      MuxAssetByIdModel(
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => _$MuxAssetByIdModelToJson(this);
}

@JsonSerializable()
class Data {

  Data({
    this.videoQuality,
    this.uploadId,
    this.tracks,
    this.status,
    this.resolutionTier,
    this.progress,
    this.playbackIds,
    this.mp4Support,
    this.maxStoredResolution,
    this.maxStoredFrameRate,
    this.maxResolutionTier,
    this.masterAccess,
    this.ingestType,
    this.id,
    this.encodingTier,
    this.duration,
    this.createdAt,
    this.aspectRatio,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  @JsonKey(name: 'video_quality')
  String? videoQuality;
  @JsonKey(name: 'upload_id')
  String? uploadId;
  List<Track>? tracks;
  String? status;
  @JsonKey(name: 'resolution_tier')
  String? resolutionTier;
  Progress? progress;
  @JsonKey(name: 'playback_ids')
  List<PlaybackId>? playbackIds;
  @JsonKey(name: 'mp4_support')
  String? mp4Support;
  @JsonKey(name: 'max_stored_resolution')
  String? maxStoredResolution;
  @JsonKey(name: 'max_stored_frame_rate')
  int? maxStoredFrameRate;
  @JsonKey(name: 'max_resolution_tier')
  String? maxResolutionTier;
  @JsonKey(name: 'master_access')
  String? masterAccess;
  @JsonKey(name: 'ingest_type')
  String? ingestType;
  String? id;
  @JsonKey(name: 'encoding_tier')
  String? encodingTier;
  double? duration;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'aspect_ratio')
  String? aspectRatio;

  Data copyWith({
    String? videoQuality,
    String? uploadId,
    List<Track>? tracks,
    String? status,
    String? resolutionTier,
    Progress? progress,
    List<PlaybackId>? playbackIds,
    String? mp4Support,
    String? maxStoredResolution,
    int? maxStoredFrameRate,
    String? maxResolutionTier,
    String? masterAccess,
    String? ingestType,
    String? id,
    String? encodingTier,
    double? duration,
    String? createdAt,
    String? aspectRatio,
  }) =>
      Data(
        videoQuality: videoQuality ?? this.videoQuality,
        uploadId: uploadId ?? this.uploadId,
        tracks: tracks ?? this.tracks,
        status: status ?? this.status,
        resolutionTier: resolutionTier ?? this.resolutionTier,
        progress: progress ?? this.progress,
        playbackIds: playbackIds ?? this.playbackIds,
        mp4Support: mp4Support ?? this.mp4Support,
        maxStoredResolution: maxStoredResolution ?? this.maxStoredResolution,
        maxStoredFrameRate: maxStoredFrameRate ?? this.maxStoredFrameRate,
        maxResolutionTier: maxResolutionTier ?? this.maxResolutionTier,
        masterAccess: masterAccess ?? this.masterAccess,
        ingestType: ingestType ?? this.ingestType,
        id: id ?? this.id,
        encodingTier: encodingTier ?? this.encodingTier,
        duration: duration ?? this.duration,
        createdAt: createdAt ?? this.createdAt,
        aspectRatio: aspectRatio ?? this.aspectRatio,
      );

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class PlaybackId {

  PlaybackId({
    this.policy,
    this.id,
  });

  factory PlaybackId.fromJson(Map<String, dynamic> json) =>
      _$PlaybackIdFromJson(json);
  String? policy;
  String? id;

  PlaybackId copyWith({
    String? policy,
    String? id,
  }) =>
      PlaybackId(
        policy: policy ?? this.policy,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$PlaybackIdToJson(this);
}

@JsonSerializable()
class Progress {

  Progress({
    this.state,
  });

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);
  String? state;

  Progress copyWith({
    String? state,
  }) =>
      Progress(
        state: state ?? this.state,
      );

  Map<String, dynamic> toJson() => _$ProgressToJson(this);
}

@JsonSerializable()
class Track {

  Track({
    this.type,
    this.maxWidth,
    this.maxHeight,
    this.maxFrameRate,
    this.id,
    this.duration,
    this.status,
    this.primary,
    this.name,
    this.maxChannels,
    this.languageCode,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  String? type;
  @JsonKey(name: 'max_width')
  int? maxWidth;
  @JsonKey(name: 'max_height' )
  int? maxHeight;
  @JsonKey(name: 'max_frame_rate')
  int? maxFrameRate;
  String? id;
  double? duration;
  String? status;
  bool? primary;
  String? name;
  @JsonKey(name: 'max_channels')
  int? maxChannels;
  @JsonKey(name: 'language_code')
  String? languageCode;

  Track copyWith({
    String? type,
    int? maxWidth,
    int? maxHeight,
    int? maxFrameRate,
    String? id,
    double? duration,
    String? status,
    bool? primary,
    String? name,
    int? maxChannels,
    String? languageCode,
  }) =>
      Track(
        type: type ?? this.type,
        maxWidth: maxWidth ?? this.maxWidth,
        maxHeight: maxHeight ?? this.maxHeight,
        maxFrameRate: maxFrameRate ?? this.maxFrameRate,
        id: id ?? this.id,
        duration: duration ?? this.duration,
        status: status ?? this.status,
        primary: primary ?? this.primary,
        name: name ?? this.name,
        maxChannels: maxChannels ?? this.maxChannels,
        languageCode: languageCode ?? this.languageCode,
      );

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
