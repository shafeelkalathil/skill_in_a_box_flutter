import 'package:auto_route/auto_route.dart';
import 'package:easy_docs_viewer/easy_docs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/lesson_view_model/lesson_progress_view_model/lesson_progress_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/lesson_view_model/lesson_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/lesson_view_model/lesson_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/notes_view_model/notes_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/curriculum_details.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';
import 'package:skill_in_a_box_flutter/features/notes/views/notes_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/overview_content.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/video_player.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class CourseContentScreen extends ConsumerStatefulWidget {
  const CourseContentScreen({
    required this.curriculumModel,
    required this.courseData,
    required this.sectionId,
    required this.lessonId,
    required this.type,
    super.key,
  });
  final Courses courseData;
  final CurriculumModel curriculumModel;
  final String sectionId;
  final String lessonId;
  final String type;
  @override
  ConsumerState<CourseContentScreen> createState() =>
      _CourseContentScreenState();
}

class _CourseContentScreenState extends ConsumerState<CourseContentScreen> {

  PdfViewerController? _pdfViewerController;

  double? totalPages;
  double? currentPages;

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 10)).then((value) {
      ref.read(lessonViewModelProvider.notifier).getLessonDetails(
          courseId: widget.courseData.courseDetails?.id ?? '',
          sectionId: widget.sectionId,
          lessonId: widget.lessonId,);
      _pdfViewerController = PdfViewerController();

    },);
    super.initState();
  }

  // bool isExpanded = false;

  void _handleVideoExit() {
    if (widget.type == SectionType.pdf.name) {
      var isFinished = false;
      if (currentPages == totalPages) {
        isFinished = true;
      }
      Future.microtask(() {
        ref.read(lessonProgressViewModelProvider.notifier).updateLessonProgress(
          courseId: widget.courseData.courseDetails?.id ?? '',
          sectionId: widget.sectionId,
          lessonId: widget.lessonId,
          currentProgress: currentPages ?? 0,
          isFinished: isFinished,
        );
      });
    }
    else if (widget.type == SectionType.slides.name){
      const isFinished = true;
      Future.microtask(() {
        ref.read(lessonProgressViewModelProvider.notifier).updateLessonProgress(
          courseId: widget.courseData.courseDetails?.id ?? '',
          sectionId: widget.sectionId,
          lessonId: widget.lessonId,
          currentProgress: 1,
          isFinished: isFinished,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    ref.listen(notesViewModelProvider, (previous, current) {
      if (current is NotesFailed) {
        showDialog<void>(
          context: context,
          builder: (context) {
            return CustomAlertBox(
              title: current.errorMessage,
            );
          },
        );
      }
    });
    final notesState = ref.watch(notesViewModelProvider);
    final lessonState = ref.watch(lessonViewModelProvider);
    final languageSelected = ref.watch(videoLanguageProvider);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        return _handleVideoExit();
      },
      child: Scaffold(
        body: lessonState is LessonStateSuccess
            ? SafeArea(
          child: Column(
            children: [
              Stack(
                children: [

                  if (lessonState.lessonModel.lessonData?.type == 'audio' ||
                      lessonState.lessonModel.lessonData?.type == 'video')
                    CustomMuxVideoPlayer(
                      assetId: languageSelected == 'Hindi'
                          ? lessonState.lessonModel
                          .lessonData?.contents?.hindi?.content?.link ?? ''
                          : lessonState.lessonModel
                          .lessonData?.contents?.english?.content?.link ?? '',
                      duration: lessonState.lessonModel
                          .lessonData?.progress?.toDouble() ?? 0.0,
                      isLessonSection: true,
                      courseId: widget.courseData.courseDetails?.id ?? '',
                      sectionId: widget.sectionId,
                      lessonId: widget.lessonId,
                    )
                  else if(lessonState.lessonModel.lessonData?.type == 'pdf')
                    Container(
                      width: context.screenWidth,
                      height: context.screenHeight * 0.35,
                      color: dark
                          ? const Color(0xff2C2C2E) : silverChalice.shade300,
                      child: Stack(
                        children: [
                          // PDF View section with fixed height
                          Positioned.fill(
                            left: context.screenWidth * 0.1,
                            right: context.screenWidth * 0.1,
                            child: SfPdfViewer.network(
                              initialPageNumber: lessonState.lessonModel
                                  .lessonData?.progress ?? 0,
                              lessonState.lessonModel
                                  .lessonData?.contents?.english?.content?.link
                                  ?? '',
                              controller: _pdfViewerController,
                              scrollDirection: PdfScrollDirection.vertical,
                              onPageChanged: (PdfPageChangedDetails details) {
                                setState(() {
                                  currentPages =
                                      _pdfViewerController?.pageNumber
                                          .toDouble() ?? 0.0;
                                  totalPages = _pdfViewerController?.pageCount
                                      .toDouble() ?? 0.0;
                                });
                              },
                             ), ),
                          Positioned(
                          top: context.screenHeight * 0.3,
                          left: context.screenWidth * 0.2,
                          right: context.screenWidth * 0.2,
                          child: Container(
                            width: context.screenWidth * 0.4,
                            height: 33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xff2C2C2E),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                            child: Row(
                              children: [
                                Text('${_pdfViewerController?.pageNumber} / '),
                                Text('${_pdfViewerController?.pageCount}'),
                                const VerticalDivider( width: 20, thickness: 2, color: Colors.white, ),
                                Text('-'),
                                Text('+'),
                                VerticalDivider( width: 20, thickness: 2, color: Colors.white, ),

                              ],
                            ), ), ),
                      ],
                    ),
                  )
                  else if(lessonState.lessonModel.lessonData?.type == 'slides')
                    Container(
                      width: context.screenWidth,
                      height: context.screenHeight * 0.35,
                      color: silverChalice.shade300,
                      child : EasyDocsViewer(
                        url:lessonState.lessonModel
                            .lessonData?.contents?.english?.content?.link
                            ?? '',
                    ),
                  )
                    else const SizedBox(),
                  IconButton(
                    onPressed: () {
                      context.router.popForced();
                    },
                    icon: SvgPicture.asset(
                      Assets.icons.backArrow,
                      colorFilter: ColorFilter.mode(
                        dark
                            ? const Color(0xffffffff)
                            : const Color(0xff2C2C2E),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(context.screenWidth * 0.06),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomOverViewContent(
                          title: widget.courseData.courseDetails?.title
                              ?? 'Title',
                          subTitleContent: [AppHelpers.removeHtmlTags(
                              widget.courseData.courseDetails?.description
                                  ?? '',),],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: context.screenHeight * 0.01,
                            bottom: context.screenHeight * 0.02,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'My Notes',
                                style: heading2,
                              ),
                              SizedBox(width: context.screenWidth*0.03),
                              if (notesState is NotesSuccess)
                                notesState.notesModel.note?.isNotEmpty ?? false
                                    ? CircleAvatar(
                                        radius: context.screenWidth * 0.03,
                                        backgroundColor: orange,
                                        child: Text(
                                          notesState.notesModel.note!.length
                                              .toString(),
                                          style: heading5.copyWith(
                                            color: silverChalice.shade50,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (notesState is NotesSuccess) {
                              final notesList = notesState.notesModel.note;
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => NotesViewSheet(
                                      courseId:
                                          widget.courseData.courseDetails!.id!,
                                      lessonId: widget.lessonId,
                                      sectionId: widget.sectionId,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: dark
                                            ? const Color(0xff222223)
                                            :silverChalice.shade200,),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.screenWidth * 0.03,
                                    vertical: context.screenWidth * 0.02,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: context.screenWidth * 0.7,
                                        child: Text(
                                          notesList == null || notesList.isEmpty
                                              ? 'Add Notes'
                                              : notesList[notesList.length - 1],
                                          overflow: TextOverflow.ellipsis,
                                          style: body1.copyWith(
                                            color: dark
                                                ? Colors.white
                                                : silverChalice.shade500,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_circle_outline_rounded,
                                        size: 24,
                                        color: orange,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return ShimmerCard(
                                width: context.screenWidth,
                                height: context.screenHeight * 0.05,
                                borderRadius: 4,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.02,
                        ),
                        CurriculumDetails(
                          course: widget.courseData,
                          curriculumModel: widget.curriculumModel,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
            : lessonState is LessonStateFailure
            ? Center(child: Text(lessonState.message),)
            : lessonState is LessonStateSuccess
            ? const Center(child: CircularProgressIndicator(),)
            : const SizedBox(),
      ),
    );
  }
}
