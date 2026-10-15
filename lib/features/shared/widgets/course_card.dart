import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_event_details_view_model/my_event_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CourseCard extends ConsumerWidget {
  const CourseCard({
    required this.courseTitle,
    required this.lectureCount,
    required this.coursePeriod,
    required this.finalPrice,
    required this.imageUrl,
    required this.id,
    this.originalPrice,
    this.courseType,
    this.isEvent = false,
    super.key,
  });

  final String courseTitle;
  final String lectureCount;
  final String coursePeriod;
  final String finalPrice;
  final String imageUrl;
  final String? originalPrice;
  final bool isEvent;
  final String id;
  final String? courseType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = AppHelpers.isDarkMode(context);
    return InkWell(
      onTap: () {
        if (isEvent) {
          context.router.push(
            EventDetailsRoute(
              eventType: EventTypes.notPurchased,
              eventTitle: courseTitle,
              eventId: id,
            ),
          );
          ref.read(myEventDetailsViewModelProvider.notifier).fetchEventDetails(
                id,
                isMyEvent: false,
              );
        } else {
          ref
              .read(doubtBoxViewModelProvider(id).notifier)
              .fetchDoubtBoxSections(courseId: id);
          context.router.push(
            CourseDetailsRoute(
              courseType: courseType!,
              courseId: id,
            ),
          );
        }
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth >= 600
              ? context.screenWidth * 0.3
              : context.screenWidth * 0.4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl.isEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  Assets.images.emptyImage.path,
                  fit: BoxFit.cover,
                  width: context.screenWidth >= 600
                      ? context.screenWidth * 0.3
                      : context.screenWidth * 0.4,
                  height: context.screenWidth >= 600
                      ? context.screenWidth * 0.3
                      : context.screenWidth * 0.4,
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: context.screenWidth >= 600
                      ? context.screenWidth * 0.3
                      : context.screenWidth * 0.44,
                  height: context.screenWidth >= 600
                      ? context.screenWidth * 0.3
                      : context.screenWidth * 0.4,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      Assets.images.emptyImage.path,
                      fit: BoxFit.cover,
                      width: context.screenWidth >= 600
                          ? context.screenWidth * 0.3
                          : context.screenWidth * 0.44,
                      height: context.screenWidth >= 600
                          ? context.screenWidth * 0.3
                          : context.screenWidth * 0.4,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return ShimmerCard(
                      borderRadius: 12,
                      width: context.screenWidth >= 600
                          ? context.screenWidth * 0.3
                          : context.screenWidth * 0.44,
                      height: context.screenWidth >= 600
                          ? context.screenWidth * 0.3
                          : context.screenWidth * 0.4,
                    );
                  },
                ),
              ),
            const SizedBox(height: 12),
            Text(
              courseTitle,
              style: subtitle4.copyWith(
                color: dark ? Colors.white : silverChalice.shade800,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            courseDetails(context, dark: dark),
            const SizedBox(height: 6),
            priceDetails(dark: dark),
          ],
        ),
      ),
    );
  }

  Widget courseDetails(BuildContext context, {required bool dark}) {
    return isEvent
        ? Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.icons.calendar),
              const SizedBox(
                width: 4,
              ),
              Flexible(
                child: Text(
                  coursePeriod,
                  style: body1.copyWith(
                    color:
                        dark ? const Color(0xffD3D3D3) : silverChalice.shade400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Flexible(
                child: Text(
                  '$lectureCount Lectures',
                  style: body1.copyWith(
                    color:
                        dark ? const Color(0xffD3D3D3) : silverChalice.shade800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              CircleAvatar(
                radius: context.screenWidth * 0.03 / 4,
                backgroundColor: silverChalice.shade200,
              ),
              const SizedBox(width: 4),
              HugeIcon(
                icon: HugeIcons.strokeRoundedClock01,
                color: orange.shade300,
                size: context.screenWidth * 0.03,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  coursePeriod,
                  style: body1.copyWith(
                    color:
                        dark ? const Color(0xffD3D3D3) : silverChalice.shade400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
  }

  Widget priceDetails({required bool dark}) {
    return Row(
      children: [
        Flexible(
          child: Text(
            finalPrice,
            style: subtitle3.copyWith(color: orange.shade500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (originalPrice != null && originalPrice!.isNotEmpty) ...[
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              originalPrice!,
              style: body1.copyWith(
                color: dark ? const Color(0xffD3D3D3) : silverChalice.shade400,
                decoration: TextDecoration.lineThrough,
                decorationColor: silverChalice.shade400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}
