import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_view_model.dart';
import 'package:skill_in_a_box_flutter/features/notes/widgets/add_note_widget.dart';
import 'package:skill_in_a_box_flutter/features/notes/widgets/notes_top_section.dart';
import 'package:skill_in_a_box_flutter/features/notes/widgets/notes_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

class NotesViewSheet extends ConsumerWidget {
  const NotesViewSheet({
    required this.courseId,
    required this.lessonId,
    required this.sectionId,
    super.key,
  });

  final String courseId;
  final String lessonId;
  final String sectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(notesViewModelProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Builder(
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(context.screenWidth * 0.06),
          height: context.screenHeight * 0.75,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: dark
                ? const Color(0xff2C2C2E):silverChalice.shade50,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const NotesTopSection(),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (notesState is NotesSuccess) {
                          final notesList = notesState.notesModel.note;
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final reversedIndex =
                                  notesList!.length - 1 - index;
                              return NotesWidget(
                                notesList: notesList,
                                courseId: courseId,
                                sectionId: sectionId,
                                lessonId: lessonId,
                                text: notesList[reversedIndex],
                                index: index + 1,
                              );
                            },
                            itemCount: notesList?.length ?? 0,
                          );
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ShimmerCard(
                                  baseColor: silverChalice.shade100,
                                  highlightColor: silverChalice.shade200,
                                  width: context.screenWidth,
                                  height: context.screenHeight * 0.08,
                                  borderRadius: 8,
                                ),
                              );
                            },
                            itemCount: 4,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: notesState is NotesSuccess
                    ? AddNoteWidget(
                        isReadonly: true,
                        notesList: notesState.notesModel.note,
                        courseId: courseId,
                        sectionId: sectionId,
                        lessonId: lessonId,
                      )
                    : ShimmerCard(
                        baseColor: silverChalice.shade100,
                        highlightColor: silverChalice.shade200,
                        width: context.screenWidth,
                        height: context.screenHeight * 0.08,
                        borderRadius: 8,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
