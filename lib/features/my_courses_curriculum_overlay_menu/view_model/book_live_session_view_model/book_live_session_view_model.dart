import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/live_session_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/book_live_session_view_model/book_live_session_states.dart';

final bookLiveSessionViewModelProvider =
    StateNotifierProvider<BookLiveSessionViewModel, BookLiveSessionStates>(
  (ref) => BookLiveSessionViewModel(ref.watch(liveSessionRepositoriesProvider)),
);

class BookLiveSessionViewModel extends StateNotifier<BookLiveSessionStates> {
  BookLiveSessionViewModel(this.liveSessionRepositories)
      : super(BookLiveSessionInitial());

  final LiveSessionRepositories liveSessionRepositories;

  Future<void> listAllSlots({
    required String courseId,
    required DateTime date,
  }) async {
    state = BookLiveSessionLoading();
    final response = await liveSessionRepositories.listAllSlots(
      courseId: courseId,
      date: DateFormat('y-MM-dd').format(date),
    );
    response.fold((errorMessage) {
      print('failed to fetch');
      state = BookLiveSessionFailed(errorMessage: errorMessage);
    }, (liveSessionData) {
      print('successfully fetched');
      state = BookLiveSessionSuccess(bookLiveSessionModel: liveSessionData);
    });
  }

  Future<void> bookSlot({
    required String slotId,
    required String topic,
    required String courseId,
    required DateTime date,
  }) async {
    print('slot id : $slotId');
    state = BookLiveSessionLoading();
    final response = await liveSessionRepositories.bookSlot(
      slotId: slotId,
      topic: topic,
    );
    response.fold((errorMessage) {
      state = BookLiveSessionFailed(errorMessage: errorMessage);
      listAllSlots(courseId: courseId, date: date);
    }, (isSuccess) {
      state = BookLiveSessionRequested();
      listAllSlots(courseId: courseId, date: date);
    });
  }
}
