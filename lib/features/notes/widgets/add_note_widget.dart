import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_view_model.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class AddNoteWidget extends ConsumerStatefulWidget {
  const AddNoteWidget({
    super.key,
    this.isReadonly = false,
    this.textEditingController,
    this.courseId,
    this.lessonId,
    this.sectionId,
    this.notesList,
    this.index,
    this.isUpdating = true,
  });

  final bool isReadonly;
  final bool isUpdating;
  final TextEditingController? textEditingController;
  final String? courseId;
  final String? lessonId;
  final String? sectionId;
  final int? index;
  final List<String>? notesList;

  @override
  ConsumerState<AddNoteWidget> createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends ConsumerState<AddNoteWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.textEditingController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.textEditingController == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    ref.listen(notesViewModelProvider, (previous, current) {
      if (current is NotesSuccess) {
        if (!widget.isReadonly) {
          Navigator.pop(context);
        }
      }
    });
    final noteState = ref.watch(notesViewModelProvider);

    return SizedBox(
      width: context.screenWidth * 0.88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              autofocus: !widget.isReadonly,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Add Note',
                hintStyle: subtitle2.copyWith(color: silverChalice.shade700),
                fillColor: dark
                    ? const Color(0xff222223):const Color(0xffffffff),
                filled: true,
                contentPadding: EdgeInsets.all(
                  context.screenWidth * 0.03,
                ),
              ),
              readOnly: widget.isReadonly,
              onTap: widget.isReadonly
                  ? () {
                      bottomSheet(context,dark: dark);
                    }
                  : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.screenWidth * 0.02,
              bottom: context.screenHeight * 0.02,
            ),
            child: Builder(
              builder: (context) {
                if (noteState is NotesLoading) {
                  return const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  );
                } else {
                  return SendButton(
                    isReadonly: widget.isReadonly,
                    isUpdating: widget.isUpdating,
                    index: widget.index,
                    courseId: widget.courseId,
                    lessonId: widget.lessonId,
                    sectionId: widget.sectionId,
                    notesList: widget.notesList,
                    textEditingController: _controller,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bottomSheet(BuildContext context,{required bool dark}) {
    return showModalBottomSheet<void>(
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
              color: dark ? const Color(0xff2C2C2E):const Color(0xffffffff),
            ),
            padding: EdgeInsets.all(context.screenWidth * 0.06),
            width: context.screenWidth,
            child: AddNoteWidget(
              courseId: widget.courseId,
              lessonId: widget.lessonId,
              sectionId: widget.sectionId,
              notesList: widget.notesList,
              isUpdating: false,
            ),
          ),
        );
      },
    );
  }
}

class SendButton extends ConsumerWidget {
  const SendButton({
    required this.isReadonly,
    required this.isUpdating,
    required this.index,
    required this.courseId,
    required this.lessonId,
    required this.sectionId,
    required this.notesList,
    required this.textEditingController,
    super.key,
  });

  final bool isReadonly;
  final bool isUpdating;
  final int? index;
  final String? courseId;
  final String? lessonId;
  final String? sectionId;
  final List<String>? notesList;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: isReadonly
          ? null
          : () {
              if (isUpdating) {
                ref.read(notesViewModelProvider.notifier).editNote(
                      index: index!,
                      courseId: courseId!,
                      lessonId: lessonId!,
                      sectionId: sectionId!,
                      noteList: notesList!,
                      newText: textEditingController.text,
                    );
              } else {
                if (textEditingController.text.isNotEmpty) {
                  ref.read(notesViewModelProvider.notifier).addNotes(
                        courseId: courseId!,
                        lessonId: lessonId!,
                        sectionId: sectionId!,
                        notesList: notesList ?? [],
                        newNote: textEditingController.text,
                      );
                }
              }
            },
      child: SvgPicture.asset(
        Assets.icons.send,
        width: 20,
      ),
    );
  }
}
