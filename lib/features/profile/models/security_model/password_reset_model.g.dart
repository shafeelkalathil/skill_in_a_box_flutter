// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassWordResetModel _$PassWordResetModelFromJson(Map<String, dynamic> json) =>
    PassWordResetModel(
      password: json['password'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$PassWordResetModelToJson(PassWordResetModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };
