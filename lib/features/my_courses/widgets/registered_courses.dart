import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/my_courses_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class RegisteredCourses extends ConsumerWidget {
  const RegisteredCourses({required this.myCourseData, super.key});
  final List<Courses> myCourseData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registeredCourses = myCourseData
        .where(
          (course) => course.status == 'registered',
        )
        .toList();
    return RefreshIndicator(
      color: orange,
      backgroundColor: Colors.white,
      onRefresh: () {
        return ref
            .read(myCourseViewModelProvider.notifier)
            .fetchMyCourses(isRefreshing: true);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: registeredCourses.isEmpty
            ? CustomDataNotFound(
                imageUrl: Assets.images.noCourses,
                title: 'No Courses',
                subTitle: "It looks like you don't "
                    'have on registered courses. ',
              )
            : Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final data = registeredCourses[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: MyCoursesCard(
                        courseData: data,
                      ),
                    );
                  },
                  itemCount: registeredCourses.length,
                ),
              ),
      ),
    );
  }
}
