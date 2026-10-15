import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_slots_model.g.dart';

@JsonSerializable()
class MySlotsModel {
  MySlotsModel({this.slot});  
  
  factory MySlotsModel.fromJson(Map<String, dynamic> json) => 
      _$MySlotsModelFromJson(json);

  final List<Slot>? slot;

  Map<String, dynamic> toJson() => _$MySlotsModelToJson(this);
}

@JsonSerializable()
class Slot {
  Slot({  
    this.id,
    this.startDateTime,
    this.endDateTime,
    this.status,
    this.facilitatorDetails,
    this.courseDetails,
    this.availableFor,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  @JsonKey(name: '_id')
  final String? id;
  final String? startDateTime;
  final String? endDateTime;
  final String? status;
  final FacilitatorDetails? facilitatorDetails;
  final CourseDetails? courseDetails;
  final List<String>? availableFor;

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}

@JsonSerializable()
class FacilitatorDetails {
  FacilitatorDetails({  
    this.firstName,
    this.lastName,
  });

  factory FacilitatorDetails.fromJson(Map<String, dynamic> json) =>
      _$FacilitatorDetailsFromJson(json);

  final String? firstName;
  final String? lastName;

  Map<String, dynamic> toJson() => _$FacilitatorDetailsToJson(this);
}

@JsonSerializable()
class CourseDetails {
  CourseDetails({this.title});  

  factory CourseDetails.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFromJson(json);

  final String? title;

  Map<String, dynamic> toJson() => _$CourseDetailsToJson(this);
}
