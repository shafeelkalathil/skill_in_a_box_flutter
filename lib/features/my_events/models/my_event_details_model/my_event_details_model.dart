import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_event_details_model.g.dart';

@JsonSerializable()
class MyEventDetailsModel {
 MyEventDetailsModel({
   this.event,
 });

 factory MyEventDetailsModel.fromJson(Map<String, dynamic> json) =>
     _$MyEventDetailsModelFromJson(json);

 final Event? event;

 Map<String, dynamic> toJson() => _$MyEventDetailsModelToJson(this);
}

@JsonSerializable()
class Event {
 Event({
   this.id,
   this.name,
   this.type,
   this.description,
   this.startDateTime,
   this.endDateTime,
   this.requirements,
   this.outcomes,
   this.facilitatorIds,
   this.status,
 });

 factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? name;
 final String? type;
 final String? description;
 final String? startDateTime;
 final String? endDateTime;
 final List<String>? requirements;
 final List<String>? outcomes;
 final List<String>? facilitatorIds;
 final String? status;

 Map<String, dynamic> toJson() => _$EventToJson(this);
}