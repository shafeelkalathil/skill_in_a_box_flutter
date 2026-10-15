// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicDetailsModel _$BasicDetailsModelFromJson(Map<String, dynamic> json) =>
    BasicDetailsModel(
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasicDetailsModelToJson(BasicDetailsModel instance) =>
    <String, dynamic>{
      'student': instance.student,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      country: json['country'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      profilePic: json['profilePic'] as String?,
      studentId: json['studentId'] as String?,
      fatherName: json['fatherName'] as String?,
      motherName: json['motherName'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'dateOfBirth': instance.dateOfBirth,
      'profilePic': instance.profilePic,
      'studentId': instance.studentId,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
    };
