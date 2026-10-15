import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_state.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/overview_section.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

@RoutePage()
class OverviewScreen extends ConsumerWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(courseViewModelProvider);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Overview'),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (state is CourseLoading) {
              return CircularProgressIndicator(
                color: orange,
              );
            } else if (state is CourseSuccess) {
              return OverviewSection(courseOverviewData: state.overview!);
            } else if (state is CourseFailure) {
              return CustomErrorWidget(
                onPressed: () {},
                errorMessage: state.message,
              );
            } else {}
            return SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: Center(
                child: CircularProgressIndicator(
                  color: orange,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
