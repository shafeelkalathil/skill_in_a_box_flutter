// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      notificationList: (json['notificationList'] as List<dynamic>)
          .map((e) => NotificationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notificationList': instance.notificationList,
    };

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) =>
    NotificationList(
      message: json['message'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$NotificationListToJson(NotificationList instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userId': instance.userId,
      'title': instance.title,
      'type': instance.type,
      'timestamp': instance.timestamp.toIso8601String(),
      '_id': instance.id,
    };
