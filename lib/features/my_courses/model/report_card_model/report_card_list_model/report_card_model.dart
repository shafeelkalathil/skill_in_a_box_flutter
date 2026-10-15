import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_card_model.g.dart';

@JsonSerializable()
class ReportCardModel {
 ReportCardModel({this.reportCard});

 factory ReportCardModel.fromJson(Map<String, dynamic> json) =>
     _$ReportCardModelFromJson(json);

 final List<ReportCard>? reportCard;

 Map<String, dynamic> toJson() => _$ReportCardModelToJson(this);
}

@JsonSerializable()
class ReportCard {
 ReportCard({
   this.id,
   this.reportDate,
   this.sectionId,
 });

 factory ReportCard.fromJson(Map<String, dynamic> json) =>
     _$ReportCardFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? reportDate;
 final String? sectionId;

 Map<String, dynamic> toJson() => _$ReportCardToJson(this);
}
