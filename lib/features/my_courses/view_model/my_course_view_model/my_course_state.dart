import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';

abstract class MyCourseState {
  MyCourseState({this.myCourseList});
  final List<Courses>? myCourseList;
}

class MyCourseInitial implements MyCourseState {
  @override
  List<Courses>? get myCourseList => null;
}

class MyCourseLoading implements MyCourseState {
  MyCourseLoading({this.listOfMyCourses});

  final List<Courses>? listOfMyCourses;
  @override
  List<Courses>? get myCourseList => listOfMyCourses;
}

class MyCourseFailure implements MyCourseState {
  MyCourseFailure(this.message, {this.listOfMyCourses});
  final String message;
  final List<Courses>? listOfMyCourses;
  @override
  List<Courses>? get myCourseList => listOfMyCourses;
}

class MyCourseSuccess implements MyCourseState {
  MyCourseSuccess({this.listOfMyCourses});

  final List<Courses>? listOfMyCourses;
  @override
  List<Courses>? get myCourseList => listOfMyCourses;
}
