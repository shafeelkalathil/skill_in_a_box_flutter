import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/book_live_session/book_live_session_model.dart';

abstract class BookLiveSessionStates {}

class BookLiveSessionInitial implements BookLiveSessionStates {}

class BookLiveSessionLoading implements BookLiveSessionStates {}

class BookLiveSessionRequested implements BookLiveSessionStates {}


class BookLiveSessionSuccess implements BookLiveSessionStates {
  BookLiveSessionSuccess({required this.bookLiveSessionModel});

  final BookLiveSessionModel bookLiveSessionModel;
}

class BookLiveSessionFailed implements BookLiveSessionStates {
  BookLiveSessionFailed({required this.errorMessage});

  final String errorMessage;
}