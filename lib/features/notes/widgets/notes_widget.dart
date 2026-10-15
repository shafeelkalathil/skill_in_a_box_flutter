import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_view_model.dart';
import 'package:skill_in_a_box_flutter/features/notes/widgets/add_note_widget.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class NotesWidget extends ConsumerWidget {
  const NotesWidget({
    required this.text,
    required this.index,
    required this.courseId,
    required this.lessonId,
    required this.sectionId,
    required this.notesList,
    super.key,
  });
  final String text;
  final int index;
  final String courseId;
  final String lessonId;
  final String sectionId;
  final List<String> notesList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = TextEditingController(text: text);
    final dark =  AppHelpers.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: index == notesList.length
            ? context.screenHeight * 0.08
            : context.screenHeight * 0.02,
      ),
      child: SizedBox(
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: context.screenWidth * 0.03,
                  backgroundColor: orange,
                  child: Text(
                    index.toString(),
                    style: heading5.copyWith(color: silverChalice.shade50),
                  ),
                ),
                Row(
                  children: [
                    editIcon(context, textEditingController, ref,dark: dark),
                    SizedBox(
                      width: context.screenWidth * 0.02,
                    ),
                    deleteIcon(context, ref,dark: dark),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: context.screenHeight * 0.1,
            ),
            Text(
              text,
              style: subtitle2.copyWith(color: dark
                  ? const Color(0xffD3D3D3) : silverChalice.shade800,),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox deleteIcon(BuildContext context, WidgetRef ref,
      {required bool dark,}) {
    return SizedBox(
      width: context.screenWidth * 0.08,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (dialogContext) => Consumer(
              builder: (context, ref, child) {
                ref.listen(notesViewModelProvider, (previous, current) {
                  if (current is NotesSuccess) {
                    Navigator.pop(dialogContext);
                  }
                });
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  actionsPadding: const EdgeInsets.only(right: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delete Note',
                        style: heading3.copyWith(
                          color: dark ? Colors.white : silverChalice.shade900,
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.close,
                          color: dark ? Colors.white : silverChalice.shade800,
                          size: 16,
                        ),
                        onTap: () {
                          context.router.popForced();
                        },
                      ),
                    ],
                  ),
                  content: Text(
                    'Are you sure you want to delete this note?',
                    style: subtitle3.copyWith(
                      color: dark ? Colors.white : silverChalice.shade500,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No, keep it',style: subtitle2.copyWith(
                        color: dark
                            ? const Color(0xffD3D3D3) : silverChalice.shade800,
                      ),),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        ref.read(notesViewModelProvider.notifier).deleteNote(
                          index: index,
                          courseId: courseId,
                          lessonId: lessonId,
                          sectionId: sectionId,
                          noteList: notesList,
                        );
                      },
                      child: Text('Yes, Delete',style: subtitle2.copyWith(
                        color: orange.shade500,
                      ),),
                    ),
                  ],
                );
              },
            ),
          );
        },
        icon: SvgPicture.asset(
          Assets.icons.delete,
          color: dark ? Colors.white : null,
        ),
      ),
    );
  }

  SizedBox editIcon(
    BuildContext context,
    TextEditingController textEditingController,
    WidgetRef ref,{required bool dark,}
  ) {
    return SizedBox(
      width: context.screenWidth * 0.08,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffffffff),
                  ),
                  padding: EdgeInsets.all(
                    context.screenWidth * 0.06,
                  ),
                  width: context.screenWidth,

                  //updating the note

                  child: AddNoteWidget(
                    textEditingController: textEditingController,
                    courseId: courseId,
                    lessonId: lessonId,
                    sectionId: sectionId,
                    index: index - 1,
                    notesList: notesList,
                  ),
                ),
              );
            },
          );
        },
        icon: SvgPicture.asset(
          Assets.icons.edit2,
          color: dark ? Colors.white :null,
        ),
      ),
    );
  }
}
