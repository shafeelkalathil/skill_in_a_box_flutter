import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/error/api_exception.dart';
import 'package:skill_in_a_box_flutter/core/network/dio_client.dart';
import 'package:skill_in_a_box_flutter/features/chats/model/chat_model/chat_model.dart';
import 'package:skill_in_a_box_flutter/features/chats/model/chat_room_model/chat_room_model.dart';

import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_params.dart';

final chatRepositoriesProvider = Provider<ChatRepositories>(
      (ref) => ChatRepositories(),
);

class ChatRepositories {
  final DioClient _dioClient = getIt<DioClient>();
  final ExceptionHandler _exceptionHandler = getIt<ExceptionHandler>();

  /// Fetches all chat room.
  Stream<ChatRoomModel> fetchAllChatRooms() async* {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio
          .get<Map<String, dynamic>>(
          'https://backend.qa.sib.norqlabs.com/chat/rooms',
      );

      if (response.statusCode == 200) {
        final chatRoomData = ChatRoomModel.fromJson(response.data!);
        yield chatRoomData;
      } else {
         _exceptionHandler.getErrorMessage(response.statusCode);
      }
    } on DioException catch (e) {
      _exceptionHandler.getExceptionMessage(e);
    } catch (e) {
      throw Exception('Unknown Error Occurred');
    }
  }

  Future<Either<String, ChatRoomModel>> getAllChatRooms() async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio
          .get<Map<String, dynamic>>(
        'https://backend.qa.sib.norqlabs.com/chat/rooms',
      );

      if (response.statusCode == 200) {
        return right(ChatRoomModel.fromJson(response.data!));
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  /// get all messages
  Stream<List<Message>> getAllChat({required String roomId}) {
    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(roomId)
        .collection('messages')
        .where('isDeleted',isEqualTo: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Message.fromJson(doc.data());
      }).toList();
    });
  }


  Future<Either<String, Map<String,dynamic>>> sendMessage
      ({required SendMessageParams params}) async {
        try {
          _dioClient.dio.options.headers['Content-Type'] = 'application/json';

          final data = {
            'content': params.content,
            'messageType': params.messageType,
          };

          final response = await _dioClient.dio.post<Map<String,dynamic>>(
            'https://backend.qa.sib.norqlabs.com/chat/${params.roomId}/message',
            data: data,
          );

          if (response.statusCode == 201) {
            return right(response.data!);
          } else {
            return left(_exceptionHandler.getErrorMessage(response.statusCode));
          }
        } on DioException catch (e) {
          return left(_exceptionHandler.getExceptionMessage(e));
        } catch (e) {
          return left('Unknown Error Occurred');
        }
      }

  Future<Either<String, Map<String,dynamic>>> editMessage
      ({required EditMessageParams params}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final data = {
        'content': params.content,
        'messageType': params.messageType,
      };

      final response = await _dioClient.dio.patch<Map<String,dynamic>>(
        'https://backend.qa.sib.norqlabs.com/chat/${params.roomId}/message/${params.messageId}/edit',
        data: data,
      );

      if (response.statusCode == 200) {
        return right(response.data!);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

  Future<Either<String, Map<String,dynamic>>> deleteMessage
      ({required DeleteMessageParams params}) async {
    try {
      _dioClient.dio.options.headers['Content-Type'] = 'application/json';

      final response = await _dioClient.dio.delete<Map<String,dynamic>>(
        'https://backend.qa.sib.norqlabs.com/chat/${params.roomId}/message/${params.messageId}/delete',
      );

      if (response.statusCode == 200) {
        return right(response.data!);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e) {
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e) {
      return left('Unknown Error Occurred');
    }
  }

}
