import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_event_model.g.dart';

@JsonSerializable() 
class OnlineEventModel {
 OnlineEventModel({
   this.event,
   this.isSuccess,
 });

 factory OnlineEventModel.fromJson(Map<String, dynamic> json) =>
     _$OnlineEventModelFromJson(json);

 final Event? event;
 final bool? isSuccess;

 Map<String, dynamic> toJson() => _$OnlineEventModelToJson(this);
}

@JsonSerializable()
class Event {
 Event({
   this.id,
   this.startDateTime,
   this.endDateTime, 
   this.status,
   this.liveSessionInfo,
 });

 factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? startDateTime;
 final String? endDateTime;
 final String? status;
 final LiveSessionInfo? liveSessionInfo;

 Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class LiveSessionInfo {
 LiveSessionInfo({
   this.roomId,
   this.guestCode,
   this.guestId,
 });

 factory LiveSessionInfo.fromJson(Map<String, dynamic> json) =>
     _$LiveSessionInfoFromJson(json);

 final String? roomId;
 final String? guestCode;
 final String? guestId;

 Map<String, dynamic> toJson() => _$LiveSessionInfoToJson(this);
}