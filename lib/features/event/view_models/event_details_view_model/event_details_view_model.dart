import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/event/repositories/events_repository.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/event_details_view_model/event_details_state.dart';

final eventDetailsViewModelProvider =
    StateNotifierProvider<EventDetailsViewModel, EventDetailsState>(
  (ref) => EventDetailsViewModel(ref.watch(eventsRepositoryProvider)),
);

class EventDetailsViewModel extends StateNotifier<EventDetailsState> {
  EventDetailsViewModel(this.eventsRepository) : super(EventDetailsInitial());

  final EventsRepository eventsRepository;

  Future<void> fetchEventDetails({required String eventId}) async {
    state = EventDetailsLoading();
    final response = await eventsRepository.getEventDetails(eventId);
    response.fold((errorMessage) {
      state = EventDetailsFailed(errorMessage);
    }, (responseData) {
      state = EventDetailsSuccess(eventData: responseData);
    });
  }
}
