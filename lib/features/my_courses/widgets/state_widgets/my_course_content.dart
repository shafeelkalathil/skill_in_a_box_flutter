import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/all_coures.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/completed_courses.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/ongoing_courses.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/registered_courses.dart';

class MyCourseContentWidget extends ConsumerWidget {
  const MyCourseContentWidget({
    required this.controller,
    super.key,
  });
  final TabController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mycourseState = ref.watch(myCourseViewModelProvider);
    return TabBarView(
      controller: controller,
      children: [
        AllCourses(
          myCourseData: mycourseState.myCourseList!,
        ),
        OngoingCourses(
          myCourseData: mycourseState.myCourseList!,
        ),
        RegisteredCourses(
          myCourseData: mycourseState.myCourseList!,
        ),
        CompletedCourses(
          myCourseData: mycourseState.myCourseList!,
        ),
      ],
    );
  }
}
