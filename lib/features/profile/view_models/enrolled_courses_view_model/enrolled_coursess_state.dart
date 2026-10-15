import 'package:skill_in_a_box_flutter/features/profile/models/enrolled_courses_model/enrolled_courses_model.dart';

abstract class EnrolledCoursessState {
  EnrolledCoursessState({this.enrolledCourses});

  final EnrolledCourses? enrolledCourses;
}

class EnrolledCoursesInitial implements EnrolledCoursessState {
  @override
  EnrolledCourses? get enrolledCourses => null;
}

class EnrolledCoursesLoading implements EnrolledCoursessState {
  EnrolledCoursesLoading();
  @override
  EnrolledCourses? get enrolledCourses => null;
}

class EnrolledCoursesSuccess implements EnrolledCoursessState {
  EnrolledCoursesSuccess({this.coursesEnrolled});
  @override
  EnrolledCourses? get enrolledCourses => coursesEnrolled;
  final EnrolledCourses? coursesEnrolled;
}

class EnrolledCoursesFailed implements EnrolledCoursessState {
  EnrolledCoursesFailed({
    required this.errorMessage,
    this.coursesEnrolled,
  });
  @override
  EnrolledCourses? get enrolledCourses => coursesEnrolled;
  final EnrolledCourses? coursesEnrolled;
  final String errorMessage;
}
