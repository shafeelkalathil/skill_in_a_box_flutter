import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_schedule_view_model/my_schedule_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class MyScheduleCard extends ConsumerWidget {
  const MyScheduleCard({
    required this.name,
    required this.time,
    required this.courseName,
    required this.id,
    required this.date,
    super.key,
  });
  final String name;
  final String time;
  final String courseName;
  final String id;
  final DateTime date;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffE9EAF0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff545454).withOpacity(0.1),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(18)),
              ),
              width: context.screenWidth * 0.3,
              child: Image.asset(Assets.images.cardPattern.path),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topSection(name, time, context, ref),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  'Course Name',
                  style: heading4.copyWith(color: silverChalice.shade400),
                ),
                Text(
                  courseName,
                  style: largeButton.copyWith(color: silverChalice.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topSection(
    String name,
    String time,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        topLeftSection(name, time, context),
        InkWell(
          onTap: () {
            showDialog<dynamic>(
              context: context,
              builder: (context) {
                return CustomAlertBox(
                  title: 'Cancel Booking',
                  subtitle: 'Are you sure you want to cancel this booking?',
                  actions: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: context.screenWidth * 0.02),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No, keep it',
                          style:
                              subtitle2.copyWith(color: silverChalice.shade800),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(myScheduleViewModelProvider.notifier)
                            .cancelMySlot(
                              slotId: id,
                              date: date,
                            );
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Yes, Cancel',
                        style: subtitle2.copyWith(color: orange),
                      ),
                    ),
                  ],
                  actionsAlignment: MainAxisAlignment.end,
                );
              },
            );
          },
          child: SvgPicture.asset(Assets.icons.threeDots),
        ),
      ],
    );
  }

  Widget topLeftSection(String name, String time, BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(),
        SizedBox(
          width: context.screenWidth * 0.025,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: subtitle3.copyWith(color: silverChalice.shade900),
            ),
            Text(
              time,
              style: heading4.copyWith(color: silverChalice.shade700),
            ),
          ],
        ),
      ],
    );
  }
}
