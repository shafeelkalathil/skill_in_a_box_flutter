import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_live_session_model.g.dart';

@JsonSerializable()
class BookLiveSessionModel {

  const BookLiveSessionModel({this.slot});

  factory BookLiveSessionModel.fromJson(Map<String, dynamic> json) =>
      _$BookLiveSessionModelFromJson(json);
  final List<Slot>? slot;

  Map<String, dynamic> toJson() => _$BookLiveSessionModelToJson(this);
}

@JsonSerializable()
class Slot {

  const Slot({
    this.id,
    this.startDateTime,
    this.endDateTime,
    this.status,
    this.isRequested,
    this.requestsLength,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
  @JsonKey(name: '_id')
  final String? id;
  final String? startDateTime;
  final String? endDateTime;
  final String? status;
  final bool? isRequested;
  final int? requestsLength;

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}
