import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/home/model/popular_course_model.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/home_top_section.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/section_title.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/course_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';

class PopularCourses extends ConsumerWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    return Padding(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      child: Column(
        children: [
          HomeSectionTitle(
            title: 'Popular Courses',
            actionText: 'All Courses',
            onTap: () {
              context.router.push(
                const CoursesRoute(),
              );
            },
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Builder(
            builder: (context) {
              final filteredCourses = filterCourse(homeState, ref);
              if (filteredCourses.isNotEmpty) {
                return CustomGridView(
                  childAspectRatio: context.screenWidth >= 600
                      ? 0.4 + context.screenWidth * 0.001
                      : 0.1 + context.screenWidth * 0.0013,
                  itemLength: filteredCourses.length,
                  itemBuilder: (context, index) {
                    final courseData = filteredCourses[index];
                    return CourseCard(
                      id: courseData.id,
                      courseType: courseData.type,
                      courseTitle: courseData.title,
                      lectureCount: '',
                      coursePeriod: '${courseData.validity.numberOf} '
                          '${courseData.validity.type}',
                      finalPrice: '₹${courseData.courseFee}',
                      originalPrice: '₹${courseData.totalPrice}',
                      imageUrl: courseData.thumbnail,
                    );
                  },
                );
              } else {
                return SizedBox(
                  height: context.screenHeight * 0.1,
                  width: context.screenWidth,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  List<PopularCourseModel> filterCourse(HomeState homeState, WidgetRef ref) {
    final popularCourses = homeState.popularCourse;
    final filteredCourses = popularCourses!
        .where(
          (course) => course.title
              .toLowerCase()
              .contains(ref.watch(homeSearchProvider)),
        )
        .toList();
    return filteredCourses;
  }
}
