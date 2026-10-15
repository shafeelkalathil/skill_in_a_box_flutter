import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course/course_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_curriculum/course_curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/repositories/course_repositorie.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_state.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>(
  (ref) => CourseViewModel(
    courseRepository: ref.read(courseRepositoryProvider),
  ),
);

final courseStreamProvider = StreamProvider<List<Course>>(
  (ref) => ref.read(courseViewModelProvider.notifier).getAllCourses(),
);

class CourseViewModel extends StateNotifier<CourseState> {
  CourseViewModel({required this.courseRepository}) : super(CourseInitial());
  final CourseRepository courseRepository;

  /// all courses.
  Stream<List<Course>> getAllCourses() {
    return courseRepository.fetchAllCourses();
  }

  /// course overview.
  Future<CourseOverviewModel> fetchCourseOverview(
      {required String courseId}) async {
    try {
      state = CourseLoading();

      final result =
          await courseRepository.fetchCourseOverview(courseId: courseId);

      return result.fold(
        (failure) {
          state = CourseFailure(failure);
          throw Exception(failure);
        },
        (overview) {
          state = CourseSuccess('', overview);
          return overview;
        },
      );
    } catch (e) {
      state = CourseFailure('An unexpected error occurred');
      rethrow;
    }
  }


  /// course curriculum.
  Future<CourseCurriculumModel> fetchCourseCurriculum(
      {required String courseId}) async {
    try {
      // state = CourseLoading();

      final result =
          await courseRepository.fetchCourseCurriculum(courseId: courseId);

      return result.fold(
        (failure) {
          state = CourseFailure(failure);
          throw Exception(failure);
        },
        (overview) {
          state = CourseSuccess('', null);
          return overview;
        },
      );
    } catch (e) {
      state = CourseFailure('An unexpected error occurred');
      rethrow;
    }
  }
}
