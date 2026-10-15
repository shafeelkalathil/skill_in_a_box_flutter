import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/event/models/all_events/all_events_model.dart';
import 'package:skill_in_a_box_flutter/features/home/model/popular_course_model.dart';
import 'package:skill_in_a_box_flutter/features/home/repositories/home_repositories.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/profile/repositories/basic_details_repository.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    homeRepositories: ref.read(homeRepositoriesProvider),
    basicDetailsRepository: ref.read(basicDetailsRepositoryProvider),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({
    required this.homeRepositories,
    required this.basicDetailsRepository,
  }) : super(HomeInitial());

  final HomeRepositories homeRepositories;
  final BasicDetailsRepository basicDetailsRepository;

  Future<void> fetchHomeData({bool isRefreshing = false}) async {
    print('XXXXX FETCH HOME DATA CALLED');
    late List<PopularCourseModel> listOfPopularCourses;
    late AllEventsModel upcomingEvents;
    if ((state.popularCourse == null && state.upcomingEvents == null) ||
        isRefreshing) {
      state = HomeLoading(
        listOfPopularCourses: state.popularCourse,
        listOfUpcomingEvents: state.upcomingEvents,
      );
    }

    //Popular Course
    final popularCoursesResponse = await homeRepositories.getPopularCourses();
    final isPopularCourseFetched = popularCoursesResponse.fold(
      (errorMessage) {
        state = HomeFailure(
          errorMessage: errorMessage,
          listOfPopularCourses: state.popularCourse,
          listOfUpcomingEvents: state.upcomingEvents,
        );
        return false;
      },
      (responseData) {
        listOfPopularCourses = responseData;
        return true;
      },
    );
    if (!isPopularCourseFetched) return;

    //Popular Events
    final popularEventsResponse = await homeRepositories.getPopularEvents();
    final isPopularEventsFetched = popularEventsResponse.fold(
      (errorMessage) {
        state = HomeFailure(
          errorMessage: errorMessage,
          listOfPopularCourses: state.popularCourse,
          listOfUpcomingEvents: state.upcomingEvents,
        );
        return false;
      },
      (responseData) {
        upcomingEvents = responseData;
        return true;
      },
    );
    if (!isPopularEventsFetched) return;

    state = HomeSuccess(
      listOfPopularCourses: listOfPopularCourses,
      listOfUpcomingEvents: upcomingEvents,
    );
  }
}
