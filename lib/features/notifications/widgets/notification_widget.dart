import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    required this.type,
    super.key,
    this.title,
    this.description,
    this.time,
  });

  final String? title;
  final String? description;
  final String? time;
  final String type;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final iconAsset = _getIconAsset(type);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          iconAsset,
          width: 46,
        ),
        SizedBox(
          width: context.screenWidth * 0.72,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? 'Title',
                style: subtitle3.copyWith(
                  color: dark ? Colors.white : silverChalice.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description ?? 'description',
                style: heading4.copyWith(
                  color: dark
                      ? const Color(0xffD3D3D3) : silverChalice.shade500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time ?? 'time',
                style: heading4.copyWith(
                  color: dark
                      ? const Color(0xffD3D3D3) : silverChalice.shade300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getIconAsset(String type) {
    switch (type) {
      case 'eventPurchaseSuccessful':
        return Assets.icons.evetPurchaseNotification;
      case 'courseCompletedSuccessful':
        return Assets.icons.courseCompletedNotification;
      case 'certificateReady':
        return 'certificateReadyNotification';
      case 'finalExamResultsOut':
        return Assets.icons.finalExamResultNotification;
      case 'reportCardReady':
        return Assets.icons.reportCardReadyNotification;
      case 'assignmentGraded':
        return Assets.icons.assignmentGradedNotification;
      case 'newQuizAssigned':
        return Assets.icons.newQuizNotification;
      case 'newAssignmentAssigned':
        return Assets.icons.newAssignmentNotification;
      case 'liveSessionCanceled':
        return Assets.icons.liveSessionCancelledNotification;
      case 'sessionRequestRejected':
        return Assets.icons.sessionRequestRejectedNotification;
      case 'sessionRequestAccepted':
        return Assets.icons.sessionRequestAcceptedNotification;
      case 'liveMeetingBooked':
        return Assets.icons.liveMeetingNotification;
      case 'kitOnTheWay':
        return Assets.icons.kitOnTheWayNotification;
      case 'addedToBatch':
        return Assets.icons.addedToBatchNotification;
      case 'informationUpdated':
        return Assets.icons.informationUpdatedNotification;
      case 'paymentReceivedSuccessful':
        return Assets.icons.paymentReceivedSuccessfulNotification;
      case 'loanApplicationProcessed':
        return Assets.icons.loanApplicationProcessedNotification;
      case 'loanDocumentsRejected':
        return Assets.icons.loanDocumentRejectedNotification;
      case 'registrationSuccessful':
        return Assets.icons.registrationSuccessfulNotification;
      default:
        return Assets.icons.defaultNotification;
    }
  }
}
