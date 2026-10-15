// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'messages': instance.messages,
      'total': instance.total,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      messageId: json['messageId'] as String?,
      content: json['content'] as String?,
      sentBy: json['sentBy'] == null
          ? null
          : SentBy.fromJson(json['sentBy'] as Map<String, dynamic>),
      sentAt: (json['sentAt'] as num?)?.toInt(),
      messageType: json['messageType'] as String?,
      editedAt: (json['editedAt'] as num?)?.toInt(),
      isDeleted: json['isDeleted'] as bool?,
      seenBy: json['seenBy'] as List<dynamic>?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'messageId': instance.messageId,
      'content': instance.content,
      'sentBy': instance.sentBy,
      'sentAt': instance.sentAt,
      'messageType': instance.messageType,
      'editedAt': instance.editedAt,
      'isDeleted': instance.isDeleted,
      'seenBy': instance.seenBy,
    };

SentBy _$SentByFromJson(Map<String, dynamic> json) => SentBy(
      id: json['id'] as String?,
      name: json['name'] as String?,
      profilePic: json['profilePic'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$SentByToJson(SentBy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePic': instance.profilePic,
      'userType': instance.userType,
    };
