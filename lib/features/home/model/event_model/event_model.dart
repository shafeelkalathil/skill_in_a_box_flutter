
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_model.g.dart';
@JsonSerializable()
class EventModel {

  EventModel({
    this.event,
    this.totalDocuments,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
  List<Event>? event;
  int? totalDocuments;

  EventModel copyWith({
    List<Event>? event,
    int? totalDocuments,
  }) =>
      EventModel(
        event: event ?? this.event,
        totalDocuments: totalDocuments ?? this.totalDocuments,
      );

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
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
    this.type,
    this.pricing,
    this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? name;
  Thumbnail? thumbnail;
  DateTime? startDateTime;
  DateTime? endDateTime;
  String? status;
  String? type;
  Pricing? pricing;
  String? description;

  Event copyWith({
    String? id,
    String? name,
    Thumbnail? thumbnail,
    DateTime? startDateTime,
    DateTime? endDateTime,
    String? status,
    String? type,
    Pricing? pricing,
    String? description,
  }) =>
      Event(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        startDateTime: startDateTime ?? this.startDateTime,
        endDateTime: endDateTime ?? this.endDateTime,
        status: status ?? this.status,
        type: type ?? this.type,
        pricing: pricing ?? this.pricing,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Pricing {

  Pricing({
    this.type,
    this.eventPrice,
    this.discountPrice,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => _$PricingFromJson(json);
  String? type;
  int? eventPrice;
  int? discountPrice;

  Pricing copyWith({
    String? type,
    int? eventPrice,
    int? discountPrice,
  }) =>
      Pricing(
        type: type ?? this.type,
        eventPrice: eventPrice ?? this.eventPrice,
        discountPrice: discountPrice ?? this.discountPrice,
      );

  Map<String, dynamic> toJson() => _$PricingToJson(this);
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

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);
  String? name;
  int? size;
  String? type;
  String? link;
  String? id;

  Thumbnail copyWith({
    String? name,
    int? size,
    String? type,
    String? link,
    String? id,
  }) =>
      Thumbnail(
        name: name ?? this.name,
        size: size ?? this.size,
        type: type ?? this.type,
        link: link ?? this.link,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

