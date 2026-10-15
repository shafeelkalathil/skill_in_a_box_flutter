import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';

import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/my_courses_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class AllCourses extends ConsumerWidget {
  const AllCourses({required this.myCourseData, super.key});
  final List<Courses> myCourseData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: myCourseData.isEmpty
            ? CustomDataNotFound(
                imageUrl: Assets.images.noCourses,
                title: 'No Courses',
                subTitle: "It looks like you haven't "
                    'upcoming courses ',
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final data = myCourseData[index];
                  return Padding(
                    padding: EdgeInsets.only(top: context.screenHeight * 0.02),
                    child: MyCoursesCard(
                      courseData: data,
                    ),
                  );
                },
                itemCount: myCourseData.length,
              ),
      ),
    );
  }
}
