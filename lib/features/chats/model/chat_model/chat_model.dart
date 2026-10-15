
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_model.g.dart';
@JsonSerializable()
class ChatModel {

  ChatModel({
    this.messages,
    this.total,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  List<Message>? messages;
  int? total;

  ChatModel copyWith({
    List<Message>? messages,
    int? total,
  }) =>
      ChatModel(
        messages: messages ?? this.messages,
        total: total ?? this.total,
      );

  Map<String, dynamic> toJson() =>
      _$ChatModelToJson(this);
}

@JsonSerializable()
class Message {

  Message({
    this.messageId,
    this.content,
    this.sentBy,
    this.sentAt,
    this.messageType,
    this.editedAt,
    this.isDeleted,
    this.seenBy,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  String? messageId;
  String? content;
  SentBy? sentBy;
  int? sentAt;
  String? messageType;
  int? editedAt;
  bool? isDeleted;
  List<dynamic>? seenBy;

  Message copyWith({
    String? messageId,
    String? content,
    SentBy? sentBy,
    int? sentAt,
    String? messageType,
    int? editedAt,
    bool? isDeleted,
    List<dynamic>?  seenBy,
  }) =>
      Message(
        messageId: messageId ?? this.messageId,
        content: content ?? this.content,
        sentBy: sentBy ?? this.sentBy,
        sentAt: sentAt ?? this.sentAt,
        messageType: messageType ?? this.messageType,
        editedAt: editedAt ?? this.editedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        seenBy: seenBy ?? this.seenBy,
      );

  Map<String, dynamic> toJson() =>
      _$MessageToJson(this);
}

@JsonSerializable()
class SentBy {

  SentBy({
    this.id,
    this.name,
    this.profilePic,
    this.userType,
  });

  factory SentBy.fromJson(Map<String, dynamic> json) =>
      _$SentByFromJson(json);
  String? id;
  String? name;
  String? profilePic;
  String? userType;

  SentBy copyWith({
    String? id,
    String? name,
    String? profilePic,
    String? userType,
  }) =>
      SentBy(
        id: id ?? this.id,
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
        userType: userType ?? this.userType,
      );

  Map<String, dynamic> toJson() => _$SentByToJson(this);
}
