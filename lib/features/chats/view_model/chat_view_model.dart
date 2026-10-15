import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/chats/model/chat_model/chat_model.dart';
import 'package:skill_in_a_box_flutter/features/chats/model/chat_room_model/chat_room_model.dart';
import 'package:skill_in_a_box_flutter/features/chats/repositories/chat_repositories.dart';
import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_params.dart';
import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_state.dart';

final chatViewModelNotifier = StateNotifierProvider<ChatViewModel, ChatState>(
      (ref) => ChatViewModel(
    chatRepositories: ref.read(chatRepositoriesProvider),
  ),
);

final chatRoomStreamProvider = StreamProvider.autoDispose<ChatRoomModel>(
      (ref) => ref.watch(chatViewModelNotifier.notifier).fetchAllChatRooms(),);

final chatStreamProvider = StreamProvider
    .family.autoDispose<List<Message>, String>((ref, roomId) {
      return ref.watch(chatViewModelNotifier.notifier)
          .getAllChat(roomId: roomId);
    });


class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel({required this.chatRepositories}) : super(ChatStateInitial());

  final ChatRepositories chatRepositories;

  Stream<ChatRoomModel> fetchAllChatRooms() {
    return chatRepositories.fetchAllChatRooms();
  }

  // Future<void> getAllChatRooms() async {
  //
  //   state = SendMessageStateLoading();
  //   final result = await chatRepositories.getAllChatRooms();
  //
  //   result.fold((errorMessage) {
  //     state = SendMessageStateFailure(errorMessage);
  //   }, (successMessage) {
  //     state = SendMessageStateSuccess(successMessage);
  //   },
  //   );
  // }

  Stream<List<Message>> getAllChat({required String roomId}) {
    return chatRepositories.getAllChat(roomId: roomId);
  }


  // Future<void> getAllChat({required GetAllMessageParams params}) async {
  //
  //   state = GetMessageStateLoading();
  //   final result = await chatRepositories
  //       .getAllChat(params: params);
  //
  //   result.fold((errorMessage) {
  //     state = GetMessageStateFailure(errorMessage);
  //   }, (successMessage) {
  //     state = GetMessageStateSuccess(successMessage);
  //   },
  //   );
  // }

  Future<void> sendMessage({required SendMessageParams params}) async {

    state = SendMessageStateLoading();
    final result = await chatRepositories
        .sendMessage(params: params);

    result.fold((errorMessage) {
      state = SendMessageStateFailure(errorMessage);
    }, (successMessage) {
      state = SendMessageStateSuccess(successMessage);
    },
    );
  }

  Future<void> editMessage({required EditMessageParams params}) async {

    state = EditMessageStateLoading();
    final result = await chatRepositories
        .editMessage(params: params);

    result.fold((errorMessage) {
      state = EditMessageStateFailure(errorMessage);
    }, (successMessage) {
      state = EditMessageStateSuccess(successMessage);
    },
    );
  }

  Future<void> deleteMessage({required DeleteMessageParams params}) async {

    state = DeleteMessageStateLoading();
    final result = await chatRepositories
        .deleteMessage(params: params);

    result.fold((errorMessage) {
      state = DeleteMessageStateFailure(errorMessage);
    }, (successMessage) {
      state = DeleteMessageStateSuccess(successMessage);
    },
    );
  }
}
