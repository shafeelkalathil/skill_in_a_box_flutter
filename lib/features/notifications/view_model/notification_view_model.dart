import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/notifications/repositories/notification_repositories.dart';
import 'package:skill_in_a_box_flutter/features/notifications/view_model/notification_state.dart';

final notificationViewModelNotifier =
StateNotifierProvider<NotificationViewModel, NotificationState>(
      (ref) => NotificationViewModel(
    ref.read(notificationRepositoriesProvider),),
);


class NotificationViewModel extends StateNotifier<NotificationState> {
  NotificationViewModel(this.notificationRepositories)
      : super(NotificationStateInitial());

  final NotificationRepositories notificationRepositories;

  Future<void> getNotification() async {
    state = NotificationStateLoading();
    final result = await notificationRepositories
        .getNotification();
    result.fold((errorMessage) {
      state = NotificationStateFailure(errorMessage,);
    },(notificationModel) {
      state = NotificationStateSuccess(notificationModel);
    },
    );
  }


}
