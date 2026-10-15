import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  EventModel({
    this.event,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  final Event? event;

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}

@JsonSerializable()
class Event {
  Event({
    this.id,
    this.name,
    this.thumbnail,
    this.type,
    this.description,
    this.startDateTime,
    this.endDateTime,
    this.eventHost,
    this.category,
    this.requirements,
    this.outcomes,
    this.facilitatorIds,
    this.trailer,
    this.status,
    this.pricing,
    this.availability,
    this.isKitRequired,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final Thumbnail? thumbnail;
  final String? type;
  final String? description;
  final String? startDateTime;
  final String? endDateTime;
  final List<String>? eventHost;
  final String? category;
  final List<String>? requirements;
  final List<String>? outcomes;
  final List<String>? facilitatorIds;
  final List<Trailer>? trailer;
  final String? status;
  final Pricing? pricing;
  final Availability? availability;
  final bool? isKitRequired;

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Trailer {
  Trailer({
    this.name,
    this.size,
    this.type,
    this.link,
    this.id,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);

  final String? name;
  final int? size;
  final String? type;
  final String? link;
  final String? id;

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
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
class Pricing {
  Pricing({
    this.type,
    this.eventPrice,
    this.discountPrice,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => _$PricingFromJson(json);

  final String? type;
  final int? eventPrice;
  final int? discountPrice;

  Map<String, dynamic> toJson() => _$PricingToJson(this);
}

@JsonSerializable()
class Availability {
  Availability({
    this.type,
  });

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);

  final String? type;

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}