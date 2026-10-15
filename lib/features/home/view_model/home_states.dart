import 'package:skill_in_a_box_flutter/features/event/models/all_events/all_events_model.dart';
import 'package:skill_in_a_box_flutter/features/home/model/popular_course_model.dart';

abstract class HomeState {
  HomeState({this.popularCourse, this.upcomingEvents});

  final List<PopularCourseModel>? popularCourse;
  final AllEventsModel? upcomingEvents;
}

class HomeInitial implements HomeState {
  @override
  List<PopularCourseModel>? get popularCourse => null;
  @override
  AllEventsModel? get upcomingEvents => null;
}

class HomeLoading implements HomeState {
  HomeLoading({this.listOfPopularCourses, this.listOfUpcomingEvents});

  final List<PopularCourseModel>? listOfPopularCourses;
  final AllEventsModel? listOfUpcomingEvents;
  @override
  List<PopularCourseModel>? get popularCourse => listOfPopularCourses;
  @override
  AllEventsModel? get upcomingEvents => listOfUpcomingEvents;
}

class HomeSuccess implements HomeState {
  HomeSuccess({
    required this.listOfPopularCourses,
    required this.listOfUpcomingEvents,
  });

  final List<PopularCourseModel>? listOfPopularCourses;
  final AllEventsModel? listOfUpcomingEvents;
  @override
  List<PopularCourseModel>? get popularCourse => listOfPopularCourses;
  @override
  AllEventsModel? get upcomingEvents => listOfUpcomingEvents;
}

class HomeFailure implements HomeState {
  HomeFailure(
      {required this.errorMessage, this.listOfPopularCourses,
      this.listOfUpcomingEvents,});

  final List<PopularCourseModel>? listOfPopularCourses;
  final AllEventsModel? listOfUpcomingEvents;
  final String errorMessage;
  @override
  List<PopularCourseModel>? get popularCourse => listOfPopularCourses;
  @override
  AllEventsModel? get upcomingEvents => listOfUpcomingEvents;
}
