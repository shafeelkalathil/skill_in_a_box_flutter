class GetAllMessageParams {

  GetAllMessageParams({
    required this.roomId,
    required this.limit,
    required this.pageNo,});
  final String roomId;
  final int limit;
  final int pageNo;
}

class SendMessageParams {

  SendMessageParams({
    required this.roomId,
    required this.content,
    required this.messageType,});
  final String content;
  final String messageType;
  final String roomId;
}

class EditMessageParams {

  EditMessageParams({
    required this.roomId,
    required this.messageId,
    required this.content,
    required this.messageType,});
  final String content;
  final String messageType;
  final String roomId;
  final String messageId;
}

class DeleteMessageParams {

  DeleteMessageParams({
    required this.roomId,
    required this.messageId,});
  final String roomId;
  final String messageId;
}
