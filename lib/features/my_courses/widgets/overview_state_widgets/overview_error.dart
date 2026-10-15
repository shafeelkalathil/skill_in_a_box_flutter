import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/overview_view_model/overview_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class OverviewErrorWidget extends ConsumerWidget {
  const OverviewErrorWidget({
    required this.courseId,
    required this.errorMessage,
    super.key,
  });
  final String courseId;
  final String errorMessage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenPadding),
      child: CustomErrorWidget(
        errorMessage: errorMessage,
        onPressed: () {
          ref
              .read(overviewViewModelProvider(courseId).notifier)
              .getOverview(courseId: courseId);
        },
      ),
    );
  }
}
