import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_events_model.g.dart';

@JsonSerializable()
class AllEventsModel {
 AllEventsModel({
   this.event,
   this.totalDocuments,
 });

 factory AllEventsModel.fromJson(Map<String, dynamic> json) =>
     _$AllEventsModelFromJson(json);

 final List<Event>? event;
 final int? totalDocuments;

 Map<String, dynamic> toJson() => _$AllEventsModelToJson(this);
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
   this.pricing,
 });

 factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? name;
 final Thumbnail? thumbnail;
 final String? startDateTime;
 final String? endDateTime;
 final String? status;
 final Pricing? pricing;

 Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Thumbnail {
 Thumbnail({
   this.name,
   this.link,
   this.size,
   this.type,
   this.id,
 });

 factory Thumbnail.fromJson(Map<String, dynamic> json) =>
     _$ThumbnailFromJson(json);

 final String? name;
 final String? link;
 final int? size;
 final String? type;
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
