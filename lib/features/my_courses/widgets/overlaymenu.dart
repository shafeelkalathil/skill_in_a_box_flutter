import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/book_live_session_view_model/book_live_session_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_view_model.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class OverlayMenu extends ConsumerWidget {
  OverlayMenu({required this.courseId, super.key});

  final String courseId;

  late final List<Map<String, dynamic>> menuItems = [
    {
      'text': 'Course Setting',
      'icon': Assets.icons.courseSettingCircle,
      'route': CourseSettingsRoute(courseId: courseId),
    },
    {
      'text': 'Payment Detail',
      'icon': Assets.icons.paymentDetailsCircle,
      'route': PaymentDetailRoute(courseId: courseId),
    },
    {
      'text': 'Course Certificate',
      'icon': Assets.icons.courseCirtificateCircle,
      'route': CertificateRoute(courseId: courseId),
    },
    {
      'text': 'Doubt box',
      'icon': Assets.icons.doubtBoxCircle,
      'route': DoubtBoxRoute(courseId: courseId),
    },
    {
      'text': 'Kit Information',
      'icon': Assets.icons.kitInfoCircle,
      'route': KitInformationRoute(courseId: courseId),
    },
    {
      'text': 'Recordings',
      'icon': Assets.icons.recordingCircle,
      'route': const RecordingRoute(),
    },
    {
      'text': 'Book Live Session',
      'icon': Assets.icons.bookLiveSessionCircle,
      'route': LiveSessionBookingRoute(courseId: courseId),
    },
    {
      'text': 'Additional Assignments',
      'icon': Assets.icons.additionalAssigmentCircle,
      'route': const AdditionalAssessmentsRoute(),
    },
    {
      'text': 'Overview',
      'icon': Assets.icons.overviewCircle,
      'route': const OverviewRoute(),
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic onTap(String buttonName) {
      if (buttonName == 'Doubt box') {
        ref
            .watch(doubtBoxViewModelProvider(courseId).notifier)
            .fetchDoubtBoxSections(courseId: courseId);
      } else if (buttonName == 'Book Live Session') {
        ref
            .read(bookLiveSessionViewModelProvider.notifier)
            .listAllSlots(courseId: courseId, date: DateTime.now());
      } else if (buttonName == 'Overview') {
        ref
            .read(courseViewModelProvider.notifier)
            .fetchCourseOverview(courseId: courseId);
      }
    }

    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          padding: EdgeInsets.only(
            bottom: context.screenHeight * 0.1,
            right: context.screenWidth * 0.06,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: context.screenHeight * 0.015,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: item['route'] != null
                          ? () {
                              context.router.push(
                                item['route'] as PageRouteInfo,
                              );
                              onTap(item['text'].toString());
                            }
                          : null,
                      child: MenuItemContainer(
                        text: item['text'].toString(),
                        icon: item['icon'].toString(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MenuItemContainer extends StatelessWidget {
  const MenuItemContainer({
    required this.text,
    required this.icon,
    super.key,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 34,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              text,
              style: heading4.copyWith(color: silverChalice.shade900),
            ),
          ),
        ),
        SizedBox(width: context.screenWidth * 0.06),
        SvgPicture.asset(icon),
      ],
    );
  }
}
