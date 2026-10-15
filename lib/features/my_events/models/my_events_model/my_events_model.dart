import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_events_model.g.dart';

@JsonSerializable()
class MyEventsModel {
  MyEventsModel({
    this.event,
  });

  factory MyEventsModel.fromJson(Map<String, dynamic> json) =>
      _$MyEventsModelFromJson(json);

  final List<Event>? event;

  Map<String, dynamic> toJson() => _$MyEventsModelToJson(this);
}

@JsonSerializable()
class Event {
  Event({
    this.id,
    this.name,
    this.thumbnail,
    this.startDateTime,
    this.endDateTime,
    this.status,
    this.eventHostDetails,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final Thumbnail? thumbnail;
  final String? startDateTime;
  final String? endDateTime;
  final String? status;
  final EventHostDetails? eventHostDetails;

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Thumbnail {
  Thumbnail({
    this.name,
    this.size,
    this.type,
    this.link,
    this.id,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  final String? name;
  final int? size;
  final String? type;
  final String? link;
  final String? id;

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class EventHostDetails {
  EventHostDetails({
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  factory EventHostDetails.fromJson(Map<String, dynamic> json) =>
      _$EventHostDetailsFromJson(json);

  final String? firstName;
  final String? lastName;
  final String? profilePic;
  Map<String, dynamic> toJson() => _$EventHostDetailsToJson(this);
}
