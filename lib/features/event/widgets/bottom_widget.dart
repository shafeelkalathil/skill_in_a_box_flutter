import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/join_event_view_model/join_event_states.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/join_event_view_model/join_event_view_model.dart';

class EventBottomWidget extends ConsumerWidget {
  const EventBottomWidget({
    required this.eventType,
    required this.eventId,
    super.key,
    this.originalPrice,
    this.finalPrice,
    this.isJoinNow = true,
  });

  final String? originalPrice;
  final String? finalPrice;
  final bool isJoinNow;
  final EventTypes eventType;
  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(joinEventViewModelProvider, (prev, next) {
      if (next is JoinEventSuccess) {
        if (next.onlineEvent.event?.liveSessionInfo?.roomId == null) {
          return;
        }
      }
    });
    final dark = AppHelpers.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
      ),
      width: context.screenWidth,
      height: context.screenHeight * 0.1,
      decoration: BoxDecoration(
        color: dark ? const Color(0xff222223) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: dark ? const Color(0xff222223) : silverChalice.shade100,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: eventType == EventTypes.notPurchased
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          finalPrice ?? 'Final Price',
                          style: heading1.copyWith(
                            color: orange.shade500,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 4),
                      if (originalPrice != null && originalPrice!.isNotEmpty)
                        FittedBox(
                          child: Text(
                            originalPrice!,
                            style: subtitle2.copyWith(
                              color: dark
                                  ? const Color(0xffD3D3D3)
                                  : silverChalice.shade400,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: dark
                                  ? const Color(0xffD3D3D3)
                                  : silverChalice.shade400,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.push(CheckoutDetailsRoute());
                    },
                    child: const Text(
                      'Purchase Now',
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.15,
                vertical: context.screenWidth * 0.04,
              ),
              child: ElevatedButton(
                onPressed: eventType == EventTypes.upcoming
                    ? null
                    : eventType == EventTypes.completed
                        ? () {
                            context.router.push(const RecordingRoute());
                          }
                        : () {
                            ref
                                .read(joinEventViewModelProvider.notifier)
                                .joinEvent(eventId);
                          },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    context.screenWidth * 0.3,
                    context.screenHeight * 0.05,
                  ),
                ),
                child: Text(
                  eventType == EventTypes.completed
                      ? 'View Recordings'
                      : 'Join Now',
                ),
              ),
            ),
    );
  }
}
