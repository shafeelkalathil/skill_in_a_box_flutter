// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_extend_validity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseExtendValidityModel _$CourseExtendValidityModelFromJson(
        Map<String, dynamic> json) =>
    CourseExtendValidityModel(
      orderId: json['orderId'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$CourseExtendValidityModelToJson(
        CourseExtendValidityModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'amount': instance.amount,
    };
