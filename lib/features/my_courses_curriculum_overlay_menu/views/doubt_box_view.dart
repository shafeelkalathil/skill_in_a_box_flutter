import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/expansion_tile.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

@RoutePage()
class DoubtBoxScreen extends ConsumerStatefulWidget {
  const DoubtBoxScreen({required this.courseId, super.key});
  final String courseId;
  @override
  ConsumerState<DoubtBoxScreen> createState() => _DoubtBoxScreenState();
}

class _DoubtBoxScreenState extends ConsumerState<DoubtBoxScreen> {
  bool thumbUpSelected = false;
  bool thumbDownSelected = false;

  void toggleThumbUp() {
    setState(() {
      thumbUpSelected = !thumbUpSelected;
      thumbDownSelected = false;
    });
  }

  void toggleThumbDown() {
    setState(() {
      thumbDownSelected = !thumbDownSelected;
      thumbUpSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final doubtBoxState = ref.watch(doubtBoxViewModelProvider(widget.courseId));
    return Scaffold(
      appBar: const CustomAppBar(title: 'Doubtbox'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: context.screenWidth * 0.06,
            left: context.screenWidth * 0.06,
            right: context.screenWidth * 0.06,
          ),
          child: Builder(
            builder: (context) {
              if (doubtBoxState is DoubtBoxSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      doubtBoxState.doubtBoxSectionModel.sectionData?.length ??
                          5,
                  itemBuilder: (context, index) {
                    final sectionItem =
                        doubtBoxState.doubtBoxSectionModel.sectionData?[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: context.screenHeight * 0.02,
                      ),
                      child: CustomExpansionTile(
                        isDoubtBox: true,
                        courseData: Courses(),
                        curriculumModel: CurriculumModel(),
                        courseId: widget.courseId,
                        sectionId: sectionItem?.sessionId ?? '',
                        title: sectionItem?.title ?? 'Title',
                      ),
                    );
                  },
                );
              } else if (doubtBoxState is DoubtBoxFailed) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: context.screenWidth * 0.7,
                        child: Text(
                          doubtBoxState.errorMessage,
                          textAlign: TextAlign.center,
                          style: subtitle1.copyWith(
                            color: silverChalice.shade900,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.05,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(
                                doubtBoxViewModelProvider(widget.courseId)
                                    .notifier,
                              )
                              .fetchDoubtBoxSections(courseId: widget.courseId);
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: context.screenHeight * 0.02,
                      ),
                      child: ShimmerCard(
                        width: context.screenWidth,
                        height: context.screenHeight * 0.08,
                        borderRadius: 16,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
