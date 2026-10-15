import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_events/repositories/my_events_repository.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_states.dart';

final myEventsViewModelProvider =
    StateNotifierProvider<MyEventsViewModel, MyEventsState>(
  (ref) => MyEventsViewModel(ref.watch(myEventsRepositoryProvider)),
);

class MyEventsViewModel extends StateNotifier<MyEventsState> {
  MyEventsViewModel(this.myEventsRepository) : super(MyEventsInitial());

  final MyEventsRepository myEventsRepository;

  Future<void> fetchMyEvents({bool isRefreshing = false}) async {
    if (isRefreshing || state.myEventsModel == null) {
      state = MyEventsLoading(state.myEventsModel);
    }
    final response = await myEventsRepository.fetchMyEvents();
    response.fold((errorMessage) {
      state = MyEventsFailed(errorMessage: errorMessage);
    }, (responseData) {
      state = MyEventsSuccess(responseData);
    });
  }
}
