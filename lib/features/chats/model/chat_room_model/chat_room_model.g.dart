// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      chatRooms: (json['chatRooms'] as List<dynamic>?)
          ?.map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'chatRooms': instance.chatRooms,
    };

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => ChatRoom(
      chatRoomId: json['chatRoomId'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      unreadMessagesCount: (json['unreadMessagesCount'] as num?)?.toInt(),
      title: json['title'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'lastMessage': instance.lastMessage,
      'unreadMessagesCount': instance.unreadMessagesCount,
      'title': instance.title,
      'avatarUrl': instance.avatarUrl,
    };

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
      messageId: json['messageId'] as String?,
      content: json['content'] as String?,
      sentBy: json['sentBy'] == null
          ? null
          : SentBy.fromJson(json['sentBy'] as Map<String, dynamic>),
      sentAt: (json['sentAt'] as num?)?.toInt(),
      messageType: json['messageType'] as String?,
    );

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'content': instance.content,
      'sentBy': instance.sentBy,
      'sentAt': instance.sentAt,
      'messageType': instance.messageType,
    };

SentBy _$SentByFromJson(Map<String, dynamic> json) => SentBy(
      id: json['id'] as String?,
      name: json['name'] as String?,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$SentByToJson(SentBy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePic': instance.profilePic,
    };
