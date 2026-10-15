// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDetailsModel _$UpdateDetailsModelFromJson(Map<String, dynamic> json) =>
    UpdateDetailsModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] == null
          ? null
          : PhoneNumber.fromJson(json['phoneNumber'] as Map<String, dynamic>),
      country: json['country'] as String?,
      profilePic: json['profilePic'] as String?,
      studentId: json['studentId'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      fatherName: json['fatherName'] as String?,
      motherName: json['motherName'] as String?,
    );

Map<String, dynamic> _$UpdateDetailsModelToJson(UpdateDetailsModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'profilePic': instance.profilePic,
      'studentId': instance.studentId,
      'dateOfBirth': instance.dateOfBirth,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
    };

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) => PhoneNumber(
      countryCode: (json['countryCode'] as num?)?.toInt(),
      areaCode: json['areaCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isoCode: json['isoCode'] as String?,
    );

Map<String, dynamic> _$PhoneNumberToJson(PhoneNumber instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'areaCode': instance.areaCode,
      'phoneNumber': instance.phoneNumber,
      'isoCode': instance.isoCode,
    };
