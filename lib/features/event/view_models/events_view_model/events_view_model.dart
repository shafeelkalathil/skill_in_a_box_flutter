import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/event/repositories/events_repository.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_states.dart';

final eventsViewModelProvider =
    StateNotifierProvider<EventsViewModel, EventsState>(
  (ref) => EventsViewModel(ref.watch(eventsRepositoryProvider)),
);

class EventsViewModel extends StateNotifier<EventsState> {
  EventsViewModel(this.eventsRepository) : super(EventsInitial());

  final EventsRepository eventsRepository;

  Future<void> fetchEvents({bool isRefreshing = false}) async {
    if (isRefreshing || state.events == null) {
      state = EventsLoading(listOfEvents: state.events);
    }
    final response = await eventsRepository.getFilteredEvents();
    response.fold((errorMessage) {
      state = EventsFailed(errorMessage, listOfEvents: state.events);
    }, (responsData) {
      state = EventsSuccess(listOfEvents: responsData);
    });
  }
}
