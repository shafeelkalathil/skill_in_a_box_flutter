// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) =>
    TransactionHistory(
      transaction: (json['transaction'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionHistoryToJson(TransactionHistory instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['_id'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentDate: json['paymentDate'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      courseDetails: json['courseDetails'] == null
          ? null
          : CourseDetails.fromJson(
              json['courseDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'paymentDate': instance.paymentDate,
      'amount': instance.amount,
      'courseDetails': instance.courseDetails,
    };

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) =>
    CourseDetails(
      id: json['_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
    };
