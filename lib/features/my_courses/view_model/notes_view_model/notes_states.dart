import 'package:skill_in_a_box_flutter/features/my_courses/model/notes_model/notes_model.dart';

abstract class NotesStates {}

class NotesInitial implements NotesStates {}

class NotesLoading implements NotesStates {}


class NotesSuccess implements NotesStates {
  NotesSuccess({required this.notesModel});

  final NotesModel notesModel;
}

class NotesFailed implements NotesStates {
  NotesFailed({required this.errorMessage});

  final String errorMessage;
}
