import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_details_model.g.dart';

@JsonSerializable()
class UpdateDetailsModel {
  UpdateDetailsModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.country,
    this.profilePic,
    this.studentId,
    this.dateOfBirth,
    this.fatherName,
    this.motherName,
  });
  factory UpdateDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateDetailsModelFromJson(json);

  String? firstName;
  String? lastName;
  String? email;
  PhoneNumber? phoneNumber;
  String? country;
  String? profilePic;
  String? studentId;
  String? dateOfBirth;
  String? fatherName;
  String? motherName;

  Map<String, dynamic> toJson() => _$UpdateDetailsModelToJson(this);
}

@JsonSerializable()
class PhoneNumber {
  PhoneNumber({
    this.countryCode,
    this.areaCode,
    this.phoneNumber,
    this.isoCode,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  int? countryCode;
  String? areaCode;
  String? phoneNumber;
  String? isoCode;

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
