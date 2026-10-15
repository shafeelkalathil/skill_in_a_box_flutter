import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/overview_view_model/overview_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/overview_view_model/overview_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overview_state_widgets/overview_error.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overview_state_widgets/overview_loading.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overview_state_widgets/overview_not_available.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overview_state_widgets/overview_success.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

class CourseOverviewScreen extends ConsumerWidget {
  const CourseOverviewScreen({required this.courseId, super.key});
  final String courseId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overViewState = ref.watch(overviewViewModelProvider(courseId));
    return Scaffold(
      appBar: const CustomAppBar(title: 'Course Details'),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (overViewState is OverviewLoading) {
              return const OverviewLoadingWidget();
            } else {
              if (overViewState.overview == null) {
                return overViewState is OverviewFailure
                    ? OverviewErrorWidget(
                        courseId: courseId,
                        errorMessage: overViewState.errorMessage,
                      )
                    : const OverviewNotAvailableWidget();
              } else {
                return OverviewSuccessWidget(
                  courseOverviewData: overViewState.overview!,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
