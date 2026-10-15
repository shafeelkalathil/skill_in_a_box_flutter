// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetailsModel _$PaymentDetailsModelFromJson(Map<String, dynamic> json) =>
    PaymentDetailsModel(
      payment: (json['payment'] as List<dynamic>)
          .map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentDetailsModelToJson(
        PaymentDetailsModel instance) =>
    <String, dynamic>{
      'payment': instance.payment,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      type: json['type'] as String,
      courseFee: (json['courseFee'] as num?)?.toInt(),
      registrationAmount: (json['registrationAmount'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      installments: json['installments'] == null
          ? null
          : Installments.fromJson(json['installments'] as Map<String, dynamic>),
      document: (json['document'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'type': instance.type,
      'courseFee': instance.courseFee,
      'registrationAmount': instance.registrationAmount,
      'discount': instance.discount,
      'installments': instance.installments,
      'document': instance.document,
      'amount': instance.amount,
    };

Installments _$InstallmentsFromJson(Map<String, dynamic> json) => Installments(
      installments: (json['installments'] as List<dynamic>)
          .map((e) => Installment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstallmentsToJson(Installments instance) =>
    <String, dynamic>{
      'installments': instance.installments,
    };

Installment _$InstallmentFromJson(Map<String, dynamic> json) => Installment(
      id: json['_id'] as String,
      isPaid: json['isPaid'] as bool,
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$InstallmentToJson(Installment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isPaid': instance.isPaid,
      'name': instance.name,
      'amount': instance.amount,
    };
