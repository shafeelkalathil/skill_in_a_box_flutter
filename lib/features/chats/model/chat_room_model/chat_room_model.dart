import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.g.dart';

@JsonSerializable()
class ChatRoomModel {

  ChatRoomModel({
    this.chatRooms,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
  List<ChatRoom>? chatRooms;

  ChatRoomModel copyWith({
    List<ChatRoom>? chatRooms,
  }) =>
      ChatRoomModel(
        chatRooms: chatRooms ?? this.chatRooms,
      );

  Map<String, dynamic> toJson() =>
      _$ChatRoomModelToJson(this);
}

@JsonSerializable()
class ChatRoom {

  ChatRoom({
    this.chatRoomId,
    this.lastMessage,
    this.unreadMessagesCount,
    this.title,
    this.avatarUrl,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);
  String? chatRoomId;
  LastMessage? lastMessage;
  int? unreadMessagesCount;
  String? title;
  String? avatarUrl;

  ChatRoom copyWith({
    String? chatRoomId,
    LastMessage? lastMessage,
    int? unreadMessagesCount,
    String? title,
    String? avatarUrl,
  }) =>
      ChatRoom(
        chatRoomId: chatRoomId ?? this.chatRoomId,
        lastMessage: lastMessage ?? this.lastMessage,
        unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
        title: title ?? this.title,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
}

@JsonSerializable()
class LastMessage {

  LastMessage({
    this.messageId,
    this.content,
    this.sentBy,
    this.sentAt,
    this.messageType,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);
  String? messageId;
  String? content;
  SentBy? sentBy;
  int? sentAt;
  String? messageType;

  LastMessage copyWith({
    String? messageId,
    String? content,
    SentBy? sentBy,
    int? sentAt,
    String? messageType,
  }) =>
      LastMessage(
        messageId: messageId ?? this.messageId,
        content: content ?? this.content,
        sentBy: sentBy ?? this.sentBy,
        sentAt: sentAt ?? this.sentAt,
        messageType: messageType ?? this.messageType,
      );

  Map<String, dynamic> toJson() =>
      _$LastMessageToJson(this);
}

@JsonSerializable()
class SentBy {

  SentBy({
    this.id,
    this.name,
    this.profilePic,
  });

  factory SentBy.fromJson(Map<String, dynamic> json) => _$SentByFromJson(json);
  String? id;
  String? name;
  String? profilePic;

  SentBy copyWith({
    String? id,
    String? name,
    String? profilePic,
  }) =>
      SentBy(
        id: id ?? this.id,
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
      );

  Map<String, dynamic> toJson() => _$SentByToJson(this);
}
