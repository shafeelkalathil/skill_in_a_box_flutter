import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/event/repositories/events_repository.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/event_details_view_model/event_details_state.dart';

final myEventDetailsViewModelProvider =
    StateNotifierProvider<MyEventDetailsViewModel, EventDetailsState>(
  (ref) => MyEventDetailsViewModel(ref.watch(eventsRepositoryProvider)),
);

class MyEventDetailsViewModel extends StateNotifier<EventDetailsState> {
  MyEventDetailsViewModel(this.eventsRepository) : super(EventDetailsInitial());

  final EventsRepository eventsRepository;

  Future<void> fetchEventDetails(
    String eventId, {
    required bool isMyEvent,
  }) async {
    state = EventDetailsLoading();
    final response =
        await eventsRepository.getEventDetails(eventId, isMyEvent: isMyEvent);
    response.fold((errorMessage) {
      state = EventDetailsFailed(errorMessage);
    }, (responseData) {
      state = EventDetailsSuccess(eventData: responseData);
    });
  }
}
