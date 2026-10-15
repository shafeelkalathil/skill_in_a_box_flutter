// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_extend_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseExtendDataModel _$CourseExtendDataModelFromJson(
        Map<String, dynamic> json) =>
    CourseExtendDataModel(
      extendFees:
          ExtendFees.fromJson(json['extendFees'] as Map<String, dynamic>),
      courseValidity: DateTime.parse(json['courseValidity'] as String),
      courseCancellationFee: (json['courseCancellationFee'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseExtendDataModelToJson(
        CourseExtendDataModel instance) =>
    <String, dynamic>{
      'extendFees': instance.extendFees,
      'courseCancellationFee': instance.courseCancellationFee,
      'courseValidity': instance.courseValidity.toIso8601String(),
    };

ExtendFees _$ExtendFeesFromJson(Map<String, dynamic> json) => ExtendFees(
      oneMonthExtensionFee: (json['oneMonthExtensionFee'] as num).toInt(),
      threeMonthExtensionFee: (json['threeMonthExtensionFee'] as num).toInt(),
      sixMonthExtensionFee: (json['sixMonthExtensionFee'] as num).toInt(),
      oneYearExtensionFee: (json['oneYearExtensionFee'] as num).toInt(),
    );

Map<String, dynamic> _$ExtendFeesToJson(ExtendFees instance) =>
    <String, dynamic>{
      'oneMonthExtensionFee': instance.oneMonthExtensionFee,
      'threeMonthExtensionFee': instance.threeMonthExtensionFee,
      'sixMonthExtensionFee': instance.sixMonthExtensionFee,
      'oneYearExtensionFee': instance.oneYearExtensionFee,
    };
