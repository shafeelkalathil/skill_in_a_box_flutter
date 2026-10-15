import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_model.g.dart';

@JsonSerializable()
class RecordingModel {
 RecordingModel({
   this.recording,
 });

 factory RecordingModel.fromJson(Map<String, dynamic> json) =>
     _$RecordingModelFromJson(json);

 final List<Recording>? recording;

 Map<String, dynamic> toJson() => _$RecordingModelToJson(this);
}

@JsonSerializable()
class Recording {
 Recording({
   this.id,
   this.startDateTime,
   this.endDateTime,
 });

 factory Recording.fromJson(Map<String, dynamic> json) =>
     _$RecordingFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? startDateTime;
 final String? endDateTime;

 Map<String, dynamic> toJson() => _$RecordingToJson(this);
}