import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_details_model.g.dart';

@JsonSerializable()
class BasicDetailsModel {
  BasicDetailsModel({this.student});

  factory BasicDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BasicDetailsModelFromJson(json);
  Student? student;

  Map<String, dynamic> toJson() => _$BasicDetailsModelToJson(this);
}

@JsonSerializable()
class Student {
  Student({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.country,
    this.dateOfBirth,
    this.profilePic,
    this.studentId,
    this.fatherName,
    this.motherName,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? country;
  String? dateOfBirth;
  String? profilePic;
  String? studentId;
  String? fatherName;
  String? motherName;

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  Student copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? country,
    String? dateOfBirth,
    String? profilePic,
    String? studentId,
    String? fatherName,
    String? motherName,
  }) {
    return Student(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profilePic: profilePic ?? this.profilePic,
      studentId: studentId ?? this.studentId,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
    );
  }
}
