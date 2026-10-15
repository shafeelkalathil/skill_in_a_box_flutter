// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitModel _$KitModelFromJson(Map<String, dynamic> json) => KitModel(
      kit: Kit.fromJson(json['kit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KitModelToJson(KitModel instance) => <String, dynamic>{
      'kit': instance.kit,
    };

Kit _$KitFromJson(Map<String, dynamic> json) => Kit(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      machine: Machine.fromJson(json['machine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KitToJson(Kit instance) => <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
      'status': instance.status,
      'machine': instance.machine,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };

Machine _$MachineFromJson(Map<String, dynamic> json) => Machine(
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$MachineToJson(Machine instance) => <String, dynamic>{
      'quantity': instance.quantity,
    };
