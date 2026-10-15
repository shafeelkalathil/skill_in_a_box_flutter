// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      permanentAddress: json['permanentAddress'] == null
          ? null
          : Address.fromJson(json['permanentAddress'] as Map<String, dynamic>),
      shippingAddress: (json['shippingAddress'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'permanentAddress': instance.permanentAddress,
      'shippingAddress': instance.shippingAddress,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['_id'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      pinCode: json['pinCode'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      '_id': instance.id,
      'address': instance.address,
      'country': instance.country,
      'pinCode': instance.pinCode,
      'city': instance.city,
      'state': instance.state,
    };
