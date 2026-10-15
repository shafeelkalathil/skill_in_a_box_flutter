import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/notes_model/notes_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_states.dart';

final notesViewModelProvider =
    StateNotifierProvider<NotesViewModel, NotesStates>(
  (ref) => NotesViewModel(ref.watch(myCourseRepositoryProvider)),
);

class NotesViewModel extends StateNotifier<NotesStates> {
  NotesViewModel(this.myCourseRepository) : super(NotesInitial());

  final MyCourseRepository myCourseRepository;

  Future<void> fetchNotes({
    required String courseId,
    required String lessonId,
    required String sectionId,
  }) async {
    state = NotesLoading();
    final response = await myCourseRepository.getNotes(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
    );
    response.fold((errorMessage) {
      state = NotesFailed(errorMessage: errorMessage);
    }, (notesData) {
      state = NotesSuccess(notesModel: notesData);
    });
  }

  Future<void> updateNotes({
    required String courseId,
    required String lessonId,
    required String sectionId,
    required List<String> updatedNotes,
  }) async {
    state = NotesLoading();
    final response = await myCourseRepository.updateNote(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
      note: updatedNotes,
    );
    response.fold((errorMessage) {
      state = NotesFailed(errorMessage: errorMessage);
    }, (isUpdated) {
      final updatedNoteModel = NotesModel(note: updatedNotes);
      state = NotesSuccess(notesModel: updatedNoteModel);
    });
  }

  Future<void> deleteNote({
    required int index,
    required String courseId,
    required String lessonId,
    required String sectionId,
    required List<String> noteList,
  }) async {
    final totalItems = noteList.length;
    final regularIndex = totalItems - 1 - (index - 1);
    noteList.removeAt(regularIndex);
    await updateNotes(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
      updatedNotes: noteList,
    );
  }

  Future<void> editNote({
    required int index,
    required String courseId,
    required String lessonId,
    required String sectionId,
    required List<String> noteList,
    required String newText,
  }) async {
    final totalItems = noteList.length;
    final regularIndex = totalItems - 1 - index;
    noteList[regularIndex] = newText;
    await updateNotes(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
      updatedNotes: noteList,
    );
  }

  Future<void> addNotes({
    required String courseId,
    required String lessonId,
    required String sectionId,
    required List<String> notesList,
    required String newNote,
  }) async {
    state = NotesLoading();
    final response = await myCourseRepository.saveNote(
      courseId: courseId,
      lessonId: lessonId,
      sectionId: sectionId,
      note: newNote,
    );
    response.fold((errorMessage) {
      state = NotesFailed(errorMessage: errorMessage);
    }, (isUpdated) {
      notesList.add(newNote);
      final updatedNoteModel = NotesModel(note: notesList);
      state = NotesSuccess(notesModel: updatedNoteModel);
    });
  }
}
