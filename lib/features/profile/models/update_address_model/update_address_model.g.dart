// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAddressModel _$UpdateAddressModelFromJson(Map<String, dynamic> json) =>
    UpdateAddressModel(
      id: json['_id'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      pinCode: json['pinCode'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      addressId: json['addressId'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UpdateAddressModelToJson(UpdateAddressModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'address': instance.address,
      'country': instance.country,
      'pinCode': instance.pinCode,
      'city': instance.city,
      'state': instance.state,
      'addressId': instance.addressId,
      'type': instance.type,
    };
