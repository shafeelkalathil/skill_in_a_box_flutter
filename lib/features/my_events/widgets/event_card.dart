import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_events/models/my_events_model/my_events_model.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_event_details_view_model/my_event_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/status_badge.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class EventCard extends ConsumerWidget {
  const EventCard({
    required this.eventData,
    required this.eventType,
    this.isCompletedCard = false,
    super.key,
  });
  final bool isCompletedCard;
  final EventTypes eventType;
  final Event eventData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = AppHelpers.isDarkMode(context);
    final eventName = eventData.name ?? 'Title';
    final imageUrl = eventData.thumbnail?.link;
    final eventId = eventData.id!;
    return GestureDetector(
      onTap: () {
        ref
            .read(myEventDetailsViewModelProvider.notifier)
            .fetchEventDetails(eventId, isMyEvent: true);
        context.router.push(
          EventDetailsRoute(
            eventType: eventType,
            eventId: eventId,
            eventTitle: eventName,
          ),
        );
      },
      child: Container(
        width: context.screenWidth,
        height: context.screenHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: dark ? Colors.transparent : silverChalice.shade200,
          ),
          color: dark ? const Color(0xff2C2C2E) : null,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (imageUrl == null)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    Assets.images.emptyImage.path,
                    fit: BoxFit.cover,
                    width: context.screenWidth * 0.33,
                  ),
                )
              else
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: context.screenWidth * 0.33,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        Assets.images.emptyImage.path,
                        fit: BoxFit.cover,
                        width: context.screenWidth * 0.33,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return ShimmerCard(
                        borderRadius: 12,
                        width: context.screenWidth * 0.33,
                        height: context.screenWidth * 0.33,
                      );
                    },
                  ),
                ),
              Expanded(
                child: rightSection(context, dark: dark, eventName: eventName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rightSection(
    BuildContext context, {
    required bool dark,
    required String eventName,
  }) {
    final eventDate =
        '${eventData.startDateTime != null ? DateFormat('MMMM dd').format(
            DateTime.parse(eventData.startDateTime!),
          ) : ''} - '
        '${eventData.endDateTime != null ? DateFormat('MMMM dd, y').format(
            DateTime.parse(eventData.endDateTime!),
          ) : ''}';
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isCompletedCard)
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: context.screenHeight * 0.015),
              child: StatusBadge(
                bgColor: forestGreen.shade100,
                color: forestGreen,
                value: 'Completed',
              ),
            )
          else
            const SizedBox.shrink(),
          rightRowTop(context, dark: dark),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              eventName,
              style: subtitle3.copyWith(
                color: dark ? const Color(0xffD3D3D3) : const Color(0xff000000),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.icons.calendar,
                width: 14,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  eventDate,
                  style: body2.copyWith(
                    color:
                        dark ? const Color(0xffD3D3D3) : silverChalice.shade700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget rightRowTop(BuildContext context, {required bool dark}) {
    final profilePictureUrl = eventData.eventHostDetails?.profilePic;
    final organiserName =
        '${eventData.eventHostDetails?.firstName ?? 'Host'} ${eventData.eventHostDetails?.lastName ?? ''}';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: silverChalice.shade200,
                backgroundImage: NetworkImage(
                  profilePictureUrl ?? AppHelpers.defaultNetworkImage,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  organiserName,
                  style: subtitle3.copyWith(
                    color: dark ? Colors.white : silverChalice.shade800,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
