import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_view_model.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/certificate_view_model/certificate_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_schedule_view_model/my_schedule_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/overview_view_model/overview_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/recording_view_model/recording_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/report_card_view_model/fetch_report_cards_view_model/report_card_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_view_models.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/custom_nav_bar.dart';

@RoutePage()
class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({
    required this.navItems,
    required this.screens,
    required this.navigationType,
    super.key,
    this.isInnerNavigation = false,
    this.navBarFontSize,
    this.courseId,
  });

  final Map<String, String> navItems;
  final List<CustomNavBarScreen> screens;
  final bool isInnerNavigation;
  final double? navBarFontSize;
  final NavigationType navigationType;
  final String? courseId;

  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  final PersistentTabController _controller = PersistentTabController();
  bool _isNavigating = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.index = widget.isInnerNavigation ? 1 : 0;
    super.initState();
  }

  Future<void> _handlePop() async {
    if (_isNavigating) return;

    try {
      _isNavigating = true;
      if (_controller.index == (widget.isInnerNavigation ? 1 : 0)) {
        if (widget.isInnerNavigation) {
          if (mounted && context.router.canPop()) {
            context.router.popForced();
          }
        } else {
          await SystemNavigator.pop();
        }
      } else {
        setState(() {
          _controller.index = widget.isInnerNavigation ? 1 : 0;
        });
      }
    } finally {
      _isNavigating = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _handlePop();
      },
      child: PersistentTabView.custom(
        context,
        navBarHeight: context.screenHeight * 0.09,
        handleAndroidBackButtonPress: false,
        controller: _controller,
        customWidget: CustomNavBar(
          selectedIndex: _controller.index,
          navBarFontSize: widget.navBarFontSize,
          items: List.generate(
            widget.navItems.length,
            (index) => PersistentBottomNavBarItem(
              icon: buildIcon(
                widget.navItems.values.elementAt(index),
                context,
                isActive: _controller.index == index,
              ),
              title: widget.navItems.keys.elementAt(index),
            ),
          ),
          onItemSelected: (index) async {
            if (_isNavigating) return;

            try {
              _isNavigating = true;
              if (widget.isInnerNavigation && index == 0) {
                if (mounted && context.router.canPop()) {
                  context.router.popForced();
                }
              } else {
                setState(() {
                  _controller.jumpToTab(index);
                });

                //api calls for home
                if (widget.navigationType == NavigationType.home) {
                  switch (index) {
                    case 0:
                      await ref
                          .read(homeViewModelProvider.notifier)
                          .fetchHomeData();
                    case 2:
                      await ref
                          .read(eventsViewModelProvider.notifier)
                          .fetchEvents();
                    case 3:
                      await ref
                          .read(myCourseViewModelProvider.notifier)
                          .fetchMyCourses();
                    case 4:
                      await ref
                          .read(myEventsViewModelProvider.notifier)
                          .fetchMyEvents();
                  }
                }

                // api calls for normal my course
                else if (widget.navigationType ==
                    NavigationType.normalMyCourse) {
                  switch (index) {
                    case 1:
                      await ref
                          .read(curriculumViewModelProvider(widget.courseId!)
                              .notifier)
                          .fetchCurriculumDetails(widget.courseId!);
                    case 2:
                      await ref
                          .read(myScheduleViewModelProvider.notifier)
                          .fetchMySlots(
                            date: DateTime.now(),
                          );
                    case 3:
                      await ref
                          .read(reportCardViewModelProvider.notifier)
                          .fetchReportCards(courseId: widget.courseId!);
                    case 4:
                    // add leaderboard api here
                  }
                }

                // api calls for self learning my course
                else if (widget.navigationType ==
                    NavigationType.selflearningmyCourse) {
                  switch (index) {
                    case 1:
                      await ref
                          .read(curriculumViewModelProvider(widget.courseId!)
                              .notifier)
                          .fetchCurriculumDetails(widget.courseId!);
                    case 2:
                      await ref
                          .read(
                            overviewViewModelProvider(widget.courseId!)
                                .notifier,
                          )
                          .getOverview(courseId: widget.courseId!);

                    case 3:
                      await ref
                          .read(
                            recordingViewModelProvider(widget.courseId!)
                                .notifier,
                          )
                          .getRecordings(courseId: widget.courseId!);
                    case 4:
                      await ref
                          .read(
                            selfLearningCertificateViewModelProvider(
                              widget.courseId!,
                            ).notifier,
                          )
                          .getCertificate(courseId: widget.courseId!);
                  }
                }
              }
            } finally {
              _isNavigating = false;
            }
          },
        ),
        itemCount: widget.navItems.length,
        screens: widget.screens,
      ),
    );
  }

  Widget buildIcon(
    String assetPath,
    BuildContext context, {
    required bool isActive,
  }) {
    return SvgPicture.asset(
      width: widget.isInnerNavigation
          ? context.screenWidth * 0.08
          : context.screenWidth * 0.07,
      assetPath,
      colorFilter: ColorFilter.mode(
        isActive ? orange : silverChalice,
        BlendMode.srcIn,
      ),
    );
  }
}
