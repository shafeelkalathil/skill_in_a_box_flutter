import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class MyCourseErrorWidget extends ConsumerWidget {
  const MyCourseErrorWidget({
    required this.myCourseFailureState,
    super.key,
  });
  final MyCourseFailure myCourseFailureState;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomErrorWidget(
      errorMessage: myCourseFailureState.message,
      onPressed: () {
        ref.read(myCourseViewModelProvider.notifier).fetchMyCourses();
      },
    );
  }
}
