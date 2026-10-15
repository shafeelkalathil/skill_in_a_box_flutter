
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.g.dart';
@JsonSerializable()
class NotificationModel {

  NotificationModel({
    required this.notificationList,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  List<NotificationList> notificationList;

  NotificationModel copyWith({
    List<NotificationList>? notificationList,
  }) =>
      NotificationModel(
        notificationList: notificationList ?? this.notificationList,
      );

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable()
class NotificationList {

  NotificationList({
    required this.message,
    required this.userId,
    required this.title,
    required this.type,
    required this.timestamp,
    required this.id,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationListFromJson(json);
  String message;
  String userId;
  String title;
  String type;
  DateTime timestamp;
  @JsonKey(name: '_id')
  String id;

  NotificationList copyWith({
    String? message,
    String? userId,
    String? title,
    String? type,
    DateTime? timestamp,
    String? id,
  }) =>
      NotificationList(
        message: message ?? this.message,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}
