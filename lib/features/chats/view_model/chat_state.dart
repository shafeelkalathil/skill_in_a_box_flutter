
import 'package:skill_in_a_box_flutter/features/chats/model/chat_model/chat_model.dart';

abstract class ChatState {}

class ChatStateInitial extends ChatState {}

class GetMessageStateLoading extends ChatState {}

class GetMessageStateFailure extends ChatState {
  GetMessageStateFailure(this.message);
  final String message;
}

class GetMessageStateSuccess extends ChatState {
  GetMessageStateSuccess(this.chatModel);
  final ChatModel chatModel;
}

class SendMessageStateLoading extends ChatState {}

class SendMessageStateFailure extends ChatState {
  SendMessageStateFailure(this.message);
  final String message;
}

class SendMessageStateSuccess extends ChatState {
  SendMessageStateSuccess(this.message);
  final Map<String,dynamic> message;
}

class EditMessageStateLoading extends ChatState {}

class EditMessageStateFailure extends ChatState {
  EditMessageStateFailure(this.message);
  final String message;
}

class EditMessageStateSuccess extends ChatState {
  EditMessageStateSuccess(this.message);
  final Map<String,dynamic> message;
}

class DeleteMessageStateLoading extends ChatState {}

class DeleteMessageStateFailure extends ChatState {
  DeleteMessageStateFailure(this.message);
  final String message;
}

class DeleteMessageStateSuccess extends ChatState {
  DeleteMessageStateSuccess(this.message);
  final Map<String,dynamic> message;
}

