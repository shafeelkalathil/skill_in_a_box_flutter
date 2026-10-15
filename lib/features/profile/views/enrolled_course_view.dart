import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_courses_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_coursess_state.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/enrolled_course_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class EnrolledCourseScreen extends ConsumerStatefulWidget {
  const EnrolledCourseScreen({super.key});

  @override
  ConsumerState<EnrolledCourseScreen> createState() =>
      _EnrolledCourseScreenState();
}

class _EnrolledCourseScreenState extends ConsumerState<EnrolledCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(enrolledCoursesViewModelProvider);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Enrolled Courses'),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (state is EnrolledCoursesFailed) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.7,
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: subtitle1.copyWith(
                          color: silverChalice.shade900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(enrolledCoursesViewModelProvider.notifier)
                            .fetchEnrolledCourses();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else if (state is EnrolledCoursesLoading) {
              return SizedBox(
                width: context.screenWidth,
                height: context.screenHeight * 0.8,
                child: Center(
                  child: CircularProgressIndicator(
                    color: orange,
                  ),
                ),
              );
            } else if (state is EnrolledCoursesSuccess &&
                state.enrolledCourses?.course == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'No Courses Enrolled',
                    style: subtitle1.copyWith(color: silverChalice.shade900),
                  ),
                ),
              );
            } else {
              print('else occured');
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                    vertical: context.screenHeight * 0.01,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index ==
                                  (state.enrolledCourses!.course!.length) - 1
                              ? context.screenHeight * 0.02
                              : 0,
                        ),
                        child: EnrolledCourseCard(
                          course: state.enrolledCourses?.course?[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: context.screenHeight * 0.03);
                    },
                    itemCount: state.enrolledCourses?.course?.length ?? 3,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
