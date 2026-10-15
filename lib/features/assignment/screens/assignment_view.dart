import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_states.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_view_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_view_model/assignment_states.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_view_model/assignment_view_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/after_upload.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/assignement_details.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/assignment_loading_widget.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/before_submission.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class AssignmentViewScreen extends ConsumerWidget {
  AssignmentViewScreen({
    required this.courseId,
    required this.sectionId,
    required this.lessonId,
    super.key,
  });
  final languageProvider = StateProvider<String>((ref) => 'English');
  final String lessonId;
  final String courseId;
  final String sectionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentState = ref.watch(assignmentViewModelProvider);
    final uploadState = ref.watch(assignmentUploadViewModelProvider(lessonId));
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? Colors.black :const Color(0xfff9fbfd),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.06,
          ),
          child: SingleChildScrollView(
            child: Builder(
              builder: (context) {
                if (assignmentState is AssignmentSuccess) {
                  final assignmentData =
                      assignmentState.assignmentModel.assignment;
                  return Column(
                    children: [
                      topSection(context, ref,dark: dark),
                      AssignmentDetails(
                        isGraded: assignmentData?.graded ?? false,
                        question: ref.watch(languageProvider) == 'English'
                            ? assignmentData?.content?.english?.question ??
                                'question'
                            : assignmentData?.content?.hindi?.question ??
                                'question',
                        mark:
                            assignmentData?.totalMark.toString() ?? 'totalmark',
                        dueDays: assignmentData?.dueDays ?? '2',
                        attachments: assignmentData?.attachments ?? [],
                      ),
                      if (uploadState is AssignmentUploadInitial)
                        BeforeSubmission(
                          courseId: courseId,
                          sectionId: sectionId,
                          lessonId: lessonId,
                        )else AfterUpload(courseId: courseId,
                          sectionId: sectionId,
                          lessonId: lessonId,),
                    ],
                  );
                } else if (assignmentState is AssignmentFailed) {
                  return Text(
                    assignmentState.errorMessage,
                    style: subtitle1,
                  );
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget topSection(BuildContext context, WidgetRef ref, {required bool dark}) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenWidth * 0.04,
        bottom: context.screenWidth * 0.06,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(Assets.icons.backArrow,
                  color: dark ? Colors.white :null,),
                ),
                SizedBox(
                  width: context.screenWidth * 0.04,
                ),
                Text(
                  'Assignment',
                  style: heading1.copyWith(
                    color: dark ? Colors.white :silverChalice.shade900,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: context.screenWidth * 0.02,
                horizontal: context.screenWidth * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.8, color: const Color(0xffd8d8d8)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.internet,
                    width: 22,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.screenWidth * 0.03,
                    ),
                    child: Text(
                      ref.watch(languageProvider),
                      style: subtitle2.copyWith(color: silverChalice.shade900),
                    ),
                  ),
                ],
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    'English',
                    style: subtitle1.copyWith(color: silverChalice.shade900),
                  ),
                  onTap: () {
                    ref
                        .read(languageProvider.notifier)
                        .update((value) => 'English');
                  },
                ),
                PopupMenuItem(
                  child: Text('Hindi',
                      style: subtitle2.copyWith(color: silverChalice.shade900),),
                  onTap: () {
                    ref
                        .read(languageProvider.notifier)
                        .update((value) => 'Hindi');
                  },
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
