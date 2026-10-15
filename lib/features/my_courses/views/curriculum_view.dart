import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/curriculum_view_model/curriculum_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/curriculum_details.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/curriculum_state_widgets/curriculum_not_available.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overlaymenu.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CurriculumView extends ConsumerStatefulWidget {
  const CurriculumView({
    required this.courseData,
    this.isSelfLearningCourse = false,
    super.key,
  });
  final Courses courseData;
  final bool isSelfLearningCourse;
  @override
  ConsumerState<CurriculumView> createState() => _CurriculumViewState();
}

class _CurriculumViewState extends ConsumerState<CurriculumView> {
  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      curriculumViewModelProvider(widget.courseData.courseDetails!.id!),
    );
    final title = widget.courseData.courseDetails?.title ?? 'Title';
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (state is CurriculumLoading) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                    vertical: context.screenWidth * 0.03,
                  ),
                  child: ShimmerCard(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.2,
                    borderRadius: 16,
                  ),
                );
              },
              itemCount: 3,
            );
          } else {
            if (state.stateCurriculumModel == null) {
              return state is CurriculumFailed
                  ? CustomErrorWidget(
                      onPressed: () {
                        ref
                            .read(
                              curriculumViewModelProvider(
                                widget.courseData.courseDetails!.id!,
                              ).notifier,
                            )
                            .fetchCurriculumDetails(
                              widget.courseData.courseDetails!.id!,
                            );
                      },
                    )
                  : const CurriculumNotAvailableWidget();
            } else {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: context.screenWidth * 0.06,
                                top: context.screenHeight * 0.03,
                                right: context.screenWidth * 0.06,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: context.screenWidth,
                                    child: Text(
                                      title,
                                      style: heading1.copyWith(
                                        color: dark
                                            ? Colors.white
                                            : silverChalice.shade900,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.screenHeight * 0.04,
                                  ),
                                  CurriculumDetails(
                                    course: widget.courseData,
                                    curriculumModel: state.stateCurriculumModel,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_showOverlay)
                    OverlayMenu(
                      courseId: widget.courseData.courseDetails!.id!,
                    ),
                ],
              );
            }
          }

          // //previous
          // if (state is CurriculumFailed) {
          //   return CustomErrorWidget(
          //     onPressed: () {
          //       ref
          //           .read(curriculumViewModelProvider.notifier)
          //           .fetchCurriculumDetails(
          //             widget.courseData.courseDetails!.id!,
          //           );
          //     },
          //   );
          // }
          // if (state is CurriculumSuccess) {
          //   return Stack(
          //     alignment: Alignment.bottomCenter,
          //     children: [
          //       SafeArea(
          //         child: Column(
          //           children: [
          //             Expanded(
          //               child: SingleChildScrollView(
          //                 child: Padding(
          //                   padding: EdgeInsets.only(
          //                     left: context.screenWidth * 0.06,
          //                     top: context.screenHeight * 0.03,
          //                     right: context.screenWidth * 0.06,
          //                   ),
          //                   child: Column(
          //                     children: [
          //                       SizedBox(
          //                         width: context.screenWidth,
          //                         child: Text(
          //                           title,
          //                           style: heading1.copyWith(
          //                             color: dark
          //                                 ? Colors.white
          //                                 : silverChalice.shade900,
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: context.screenHeight * 0.04,
          //                       ),
          //                       CurriculumDetails(
          //                         course: widget.courseData,
          //                         curriculumModel: state.curriculumModel,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       if (_showOverlay)
          //         OverlayMenu(
          //           courseId: widget.courseData.courseDetails!.id!,
          //         ),
          //     ],
          //   );
          // } else {
          //   return ListView.builder(
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: context.screenWidth * 0.06,
          //           vertical: context.screenWidth * 0.03,
          //         ),
          //         child: ShimmerCard(
          //           width: context.screenWidth,
          //           height: context.screenHeight * 0.2,
          //           borderRadius: 16,
          //         ),
          //       );
          //     },
          //     itemCount: 3,
          //   );
          // }
        },
      ),
      floatingActionButton: widget.isSelfLearningCourse
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.transparent,
              shape: const CircleBorder(),
              onPressed: _toggleOverlay,
              child: _showOverlay
                  ? SvgPicture.asset(Assets.icons.closeCircle)
                  : SvgPicture.asset(Assets.icons.addCircle),
            ),
    );
  }
}
