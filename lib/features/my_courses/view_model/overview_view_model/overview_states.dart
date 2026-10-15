 import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';

abstract class OverviewState {
  OverviewState({this.overview});

  final CourseOverviewModel? overview;
}

class OverviewInitial implements OverviewState {
  @override
  CourseOverviewModel? get overview => null;
}

class OverviewLoading implements OverviewState {
  OverviewLoading({ this.overviewOfCourse});

  final CourseOverviewModel? overviewOfCourse;

  @override
  CourseOverviewModel? get overview => overviewOfCourse;
}

class OverviewSuccess implements OverviewState {
  OverviewSuccess({
    required this.overviewOfCourse,
  });


  final CourseOverviewModel? overviewOfCourse;
  @override
  CourseOverviewModel? get overview => overviewOfCourse;
}

class OverviewFailure implements OverviewState {
  OverviewFailure(
      {required this.errorMessage,
      this.overviewOfCourse,});

  final CourseOverviewModel? overviewOfCourse;
  final String errorMessage;
 
  @override
  CourseOverviewModel? get overview => overviewOfCourse;
}
