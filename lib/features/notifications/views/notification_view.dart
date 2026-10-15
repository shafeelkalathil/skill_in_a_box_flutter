import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/formatters/date_formatter.dart';
import 'package:skill_in_a_box_flutter/features/notifications/view_model/notification_state.dart';
import 'package:skill_in_a_box_flutter/features/notifications/view_model/notification_view_model.dart';
import 'package:skill_in_a_box_flutter/features/notifications/widgets/notification_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final notificationState = ref.watch(notificationViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: notificationState is NotificationStateLoading
          ? const Center()
          : notificationState is NotificationStateFailure
          ? const Center()
          : notificationState is NotificationStateSuccess
          ? Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        child: notificationState.notificationModel.notificationList.isEmpty
            ? CustomDataNotFound(
            imageUrl: Assets.images.noMessages,
            title: 'No Notifications',
            subTitle: 'You have no notifications yet.Please come back later.',)
            :ListView.separated(
          itemCount: notificationState
              .notificationModel.notificationList.length,
          itemBuilder: (context, index) {
            final notificationData = notificationState
                .notificationModel.notificationList[index];
            return NotificationWidget(
              title: notificationData.title,
              description: notificationData.message,
              time: DateFormatter.getFormattedDate
                (notificationData.timestamp,format: 'dd MMM, yyyy hh:mm a'),
              type: notificationData.type,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
        ),
      )
          :const SizedBox(),
    );
  }
}
