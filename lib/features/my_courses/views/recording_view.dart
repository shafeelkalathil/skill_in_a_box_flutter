import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/recording_view_model/recording_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/recording_view_model/recording_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/recording_state_widgets/recording_error.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/recording_state_widgets/recording_loading.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/recording_state_widgets/recording_not_available.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/recording_state_widgets/recording_success.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

class RecordingScreen extends ConsumerWidget {
  const RecordingScreen({required this.courseId, super.key});
  final String courseId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordingState = ref.watch(recordingViewModelProvider(courseId));
    return Scaffold(
      appBar: const CustomAppBar(title: 'Recordings'),
      body: RefreshIndicator(
        color: orange,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenPadding,
            ),
            child: Builder(
              builder: (context) {
                if (recordingState is RecordingLoading) {
                  return const RecordingLoadingWidget();
                } else {
                  if (recordingState.stateRecordingData == null) {
                    return recordingState is RecordingFailure
                        ? RecordingErrorWidget(
                            courseId: courseId,
                            errorMessage: recordingState.errorMessage,
                          )
                        : const RecordingNotAvailableWidget();
                  } else {
                    return RecordingSuccessWidget(
                      recordingModel: recordingState.stateRecordingData!,
                    );
                  }
                }
              },
            ),
          ),
        ),
        onRefresh: () {
          return ref
              .read(recordingViewModelProvider(courseId).notifier)
              .getRecordings(courseId: courseId, isRefreshing: true);
        },
      ),
    );
  }
}
