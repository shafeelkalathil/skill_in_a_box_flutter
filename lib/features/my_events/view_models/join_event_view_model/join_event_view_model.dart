import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_events/repositories/my_events_repository.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/join_event_view_model/join_event_states.dart';

final joinEventViewModelProvider =
    StateNotifierProvider<JoinEventViewModel, JoinEventState>(
  (ref) => JoinEventViewModel(ref.watch(myEventsRepositoryProvider)),
);

class JoinEventViewModel extends StateNotifier<JoinEventState> {
  JoinEventViewModel(this.myEventsRepository) : super(JoinEventInitial());

  final MyEventsRepository myEventsRepository;

  Future<void> joinEvent(String eventId) async {
    state = JoinEventLoading();
    final response = await myEventsRepository.fetchOnlineEventDetails(eventId);
    response.fold((errorMessage) {
      state = JoinEventFailed(errorMessage);
    }, (responseData) {
      
      //Data for joining zoom meeting is available in responseData
      print('zoom id : ${responseData.event?.liveSessionInfo?.roomId}');

      state = JoinEventSuccess(onlineEvent: responseData);
    });
  }
}
