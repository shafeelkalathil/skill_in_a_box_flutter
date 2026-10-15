import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_list_model.g.dart';

@JsonSerializable()
class EventListModel {
 EventListModel({
   this.event,
   this.totalDocuments,
 });

 factory EventListModel.fromJson(Map<String, dynamic> json) =>
     _$EventListModelFromJson(json);

 final List<Event>? event;
 final int? totalDocuments;

 Map<String, dynamic> toJson() => _$EventListModelToJson(this);
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
 final String? id;
 final String? name;
 final Thumbnail? thumbnail;
 final String? startDateTime;
 final String? endDateTime;
 final String? status;
 final String? type;
 final Pricing? pricing;
 final String? description;

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
