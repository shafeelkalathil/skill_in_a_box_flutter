import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/recording_view_model/recording_states.dart';

final recordingViewModelProvider =
    StateNotifierProvider.family<RecordingViewModel, RecordingState, String>(
  (ref,courseId) => RecordingViewModel(ref.watch(myCourseRepositoryProvider)),
);

class RecordingViewModel extends StateNotifier<RecordingState> {
  RecordingViewModel(this.myCourseRepository) : super(RecordingInitial());

  final MyCourseRepository myCourseRepository;

  Future<void> getRecordings({
    required String courseId,
    bool isRefreshing = false,
  }) async {
    if (isRefreshing || state.stateRecordingData == null) {
      state = RecordingLoading(recordingData: state.stateRecordingData);
    }
    final response = await myCourseRepository.fetchRecording(courseId);
    response.fold((errorMessage) {
      state = RecordingFailure(
        errorMessage: errorMessage,
        recordingData: state.stateRecordingData,
      );
    }, (responsData) {
      state = RecordingSuccess(recordingData: responsData);
    });
  }
}
