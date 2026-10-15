import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/courses/repositories/course_repositorie.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/overview_view_model/overview_states.dart';

final overviewViewModelProvider =
    StateNotifierProvider.family<OverviewViewModel, OverviewState, String>(
  (ref,courseId) => OverviewViewModel(ref.watch(courseRepositoryProvider)),
);

class OverviewViewModel extends StateNotifier<OverviewState> {
  OverviewViewModel(this.courseRepository) : super(OverviewInitial());

  final CourseRepository courseRepository;


  Future<void> getOverview({
    required String courseId,
    bool isRefreshing = false,
  }) async {
    if (isRefreshing || state.overview == null) {
      state = OverviewLoading(overviewOfCourse: state.overview);
    }
    final response =
        await courseRepository.fetchCourseOverview(courseId: courseId);
    response.fold((errorMessage) {
      state = OverviewFailure(
        errorMessage: errorMessage,
        overviewOfCourse: state.overview,
      );
    }, (responsData) {
      state = OverviewSuccess(overviewOfCourse: responsData);
    });
  }
}
