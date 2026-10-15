import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/enrolled_courses_repository.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/enrolled_courses_view_model/enrolled_coursess_state.dart';

final enrolledCoursesViewModelProvider =
    StateNotifierProvider<EnrolledCoursesViewModel, EnrolledCoursessState>(
  (ref) =>
      EnrolledCoursesViewModel(ref.read(enrolledCoursesRepositoryProvider)),
);

class EnrolledCoursesViewModel extends StateNotifier<EnrolledCoursessState> {
  EnrolledCoursesViewModel(this.enrolledCoursesRepository)
      : super(EnrolledCoursesInitial());

  final EnrolledCoursesRepository enrolledCoursesRepository;

  Future<void> fetchEnrolledCourses() async {
    state = EnrolledCoursesLoading();
    final response = await enrolledCoursesRepository.getEnrolledCourses();
    response.fold((errorMessage) {
      state = EnrolledCoursesFailed(
        errorMessage: errorMessage,
        coursesEnrolled: state.enrolledCourses,
      );
    }, (coursesEnrolled) {
      state = EnrolledCoursesSuccess(coursesEnrolled: coursesEnrolled);
    });
  }
}
