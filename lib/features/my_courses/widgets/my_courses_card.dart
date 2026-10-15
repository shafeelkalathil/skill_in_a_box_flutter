import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/string_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/certificate_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/course_overview.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/curriculum_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/leader_board_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/my_courses_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/my_schedule_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/recording_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/views/report_card_view.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class MyCoursesCard extends ConsumerWidget {
  const MyCoursesCard({
    required this.courseData,
    super.key,
  });
  final Courses courseData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = AppHelpers.isDarkMode(context);
    return InkWell(
      onTap: () {
        handleButtonOnTap(context, ref);
      },
      child: Container(
        width: context.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: dark ? Colors.transparent : silverChalice.shade200,
          ),
          color: dark ? const Color(0xff2C2C2E) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: context.screenWidth * 0.3,
              height: context.screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  bottomLeft: Radius.circular(11),
                ),
                color: courseData.courseDetails?.thumbnail == null
                    ? silverChalice.shade200
                    : null,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.network(
                  courseData.courseDetails?.thumbnail ?? '',
                  fit: BoxFit.cover,
                  width: context.screenWidth * 0.3,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.asset(
                      Assets.images.logo,
                      fit: BoxFit.cover,
                      width: context.screenWidth >= 600
                          ? context.screenWidth * 0.3
                          : context.screenWidth * 0.4,
                    );
                  },
                ),
              ),
            ),
            rightSection(context, dark: dark),
          ],
        ),
      ),
    );
  }

  Widget rightSection(BuildContext context, {required bool dark}) {
    final progressValue = (courseData.progress?.completedContent ?? 0) /
        (courseData.progress?.totalContent ?? 1);
    final status = courseData.status ?? '_';
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Container(
          width: context.screenWidth * 0.54,
          padding: EdgeInsets.only(right: context.screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                courseData.courseDetails!.title ?? '_',
                overflow: TextOverflow.ellipsis,
                style: defaultButton.copyWith(
                  color: dark ? Colors.white : const Color(0xff000000),
                ),
              ),
              SizedBox(height: context.screenWidth * 0.01),
              Text(
                '${courseData.progress?.completedContent ?? 0} / ${courseData.progress?.totalContent ?? 0} lessons',
                style: heading4.copyWith(
                  color:
                      dark ? const Color(0xffD3D3D3) : silverChalice.shade800,
                ),
              ),
              SizedBox(height: context.screenHeight * 0.005),
              LinearProgressIndicator(
                backgroundColor:
                    dark ? const Color(0xff222223) : silverChalice.shade100,
                valueColor: AlwaysStoppedAnimation(getStatusColor()),
                value: progressValue,
              ),
              SizedBox(height: context.screenWidth * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        handleButtonOnTap(context, ref);
                      },
                      child: Container(
                        width: status == CourseStatus.registered.name
                            ? context.screenWidth * 0.35
                            : context.screenWidth * 0.3,
                        padding: EdgeInsets.symmetric(
                          vertical: context.screenWidth * 0.01,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: getStatusColor(),
                        ),
                        child: Center(
                          child: Text(
                            getStatusText(),
                            style: body1.copyWith(color: silverChalice.shade50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String getStatusText() {
    final status = courseData.status ?? '_';
    if (status == CourseStatus.registered.name) {
      return 'Complete Payment';
    } else if (status == CourseStatus.purchased.name) {
      return 'Start Course';
    } else if (status == CourseStatus.onGoing.name) {
      return 'Resume';
    } else {
      return status.fromCamelCaseToTitleCase();
    }
  }

  Color getStatusColor() {
    final status = courseData.status ?? '_';
    final hasBatchId = courseData.hasBatchId ?? false;
    if (status == CourseStatus.purchased.name && !hasBatchId) {
      return const Color(0xffbdbdbd);
    } else {
      final statusColors = {
        CourseStatus.registered.name: orange,
        CourseStatus.purchased.name: orange,
        CourseStatus.onGoing.name: orange,
        CourseStatus.suspended.name: red.shade600,
        CourseStatus.cancelled.name: red.shade600,
        CourseStatus.validityExpired.name: red.shade600,
        CourseStatus.completed.name: forestGreen.shade600,
      };

      return statusColors[status] ?? orange;
    }
  }

  void handleButtonOnTap(BuildContext context, WidgetRef ref) {
    final status = courseData.status ?? '_';
    final hasBatchId = courseData.hasBatchId ?? false;
    if (!hasBatchId && status == CourseStatus.purchased.name) {
      showDialog<dynamic>(
        context: context,
        builder: (context) {
          return const CustomAlertBox(
            title: 'Your Batch Will be Assigned Soon!',
            subtitle:
                'Please wait for your facilitator to assign you to a batch.'
                ' Once assigned, you can start your course!',
          );
        },
      );
    }
    if (status == CourseStatus.registered.name) {
      showDialog<dynamic>(
        context: context,
        builder: (context) {
          return CustomAlertBox(
            title: 'Complete the Payment',
            subtitle: 'Please complete the payment to assign you to a batch.',
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                  ),
                  child: const Text(
                    'Go To Payment',
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
    if (status == CourseStatus.completed.name ||
        status == CourseStatus.onGoing.name ||
        (hasBatchId && status == CourseStatus.purchased.name)) {
      ref
          .read(
            curriculumViewModelProvider(courseData.courseDetails!.id!).notifier,
          )
          .fetchCurriculumDetails(courseData.courseDetails!.id!);
      courseData.courseDetails!.type == 'selfLearning'
          ? context.router.push(NavigationRoute(
              navigationType: NavigationType.selflearningmyCourse,
              courseId: courseData.courseDetails!.id,
              navItems: {
                'My Course': Assets.icons.bottomNavMyCourse,
                'Curriculum': Assets.icons.bottomNavCurriculum,
                'Overview': Assets.icons.bottomNavOverview,
                'Recording': Assets.icons.bottomNavRecording,
                'Certificate': Assets.icons.bottomNavCertificate,
              },
              screens: [
                const CustomNavBarScreen(
                  screen: MyCoursesScreen(),
                ),
                CustomNavBarScreen(
                  screen: CurriculumView(
                    isSelfLearningCourse: true,
                    courseData: courseData,
                  ),
                ),
                CustomNavBarScreen(
                  screen: CourseOverviewScreen(
                    courseId: courseData.courseDetails!.id!,
                  ),
                ),
                CustomNavBarScreen(
                  screen: RecordingScreen(
                    courseId: courseData.courseDetails!.id!,
                  ),
                ),
                CustomNavBarScreen(
                  screen: CertificateView(
                    courseId: courseData.courseDetails!.id!,
                  ),
                ),
              ],
              isInnerNavigation: true,
              navBarFontSize: 10,
            ))
          : context.router.push(
              NavigationRoute(
                navigationType: NavigationType.normalMyCourse,
                courseId: courseData.courseDetails!.id,
                navItems: {
                  'My Course': Assets.icons.bottomNavMyCourse,
                  'Curriculum': Assets.icons.bottomNavCurriculum,
                  'My Schedule': Assets.icons.bottomNavMySchedule,
                  'Report card': Assets.icons.bottomNavReportCard,
                  'Leaderboard': Assets.icons.bottomNavLeaderboard,
                },
                screens: [
                  const CustomNavBarScreen(
                    screen: MyCoursesScreen(),
                  ),
                  CustomNavBarScreen(
                    screen: CurriculumView(
                      courseData: courseData,
                    ),
                  ),
                  CustomNavBarScreen(
                    screen: MyScheduleScreen(
                      courseId: courseData.courseDetails!.id!,
                    ),
                  ),
                  CustomNavBarScreen(
                    screen: ReportCardView(
                      courses: courseData,
                    ),
                  ),
                  CustomNavBarScreen(
                    screen: LeaderBoardView(
                      courseId: courseData.courseDetails!.id!,
                    ),
                  ),
                ],
                isInnerNavigation: true,
                navBarFontSize: 10,
              ),
            );
    }
    if (status == CourseStatus.validityExpired.name) {
      showDialog<dynamic>(
        context: context,
        builder: (context) {
          return CustomAlertBox(
            title: 'Course Validity Expired',
            subtitle: 'Your course has been expired on . '
                'Please complete the payment to continue the course',
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                  ),
                  child: const Text(
                    'Go To Payment',
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
    if (status == CourseStatus.suspended.name) {
      showDialog<dynamic>(
        context: context,
        builder: (context) {
          return CustomAlertBox(
            title: 'Course Suspended',
            subtitle: 'You are suspended from the course. '
                'Please contact your counselor for assistance.',
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                  ),
                  child: const Text(
                    'Contact Now',
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {}
  }
}
