import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/expansion_tile.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
class DoubtBoxSection extends ConsumerWidget {
  const DoubtBoxSection({required this.courseId, super.key});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doubtBoxState = ref.watch(doubtBoxViewModelProvider(courseId));
    final dark = AppHelpers.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
      child: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            if (doubtBoxState is DoubtBoxSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doubt box',
                    style: heading3.copyWith(
                      color: dark ? Colors.white : silverChalice.shade900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final sectionData = doubtBoxState
                          .doubtBoxSectionModel.sectionData?[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          top: context.screenHeight * 0.02,
                          bottom: (index ==
                                  doubtBoxState.doubtBoxSectionModel
                                          .sectionData!.length -
                                      1)
                              ? context.screenHeight * 0.14
                              : 0,
                        ),
                        child: CustomExpansionTile(
                          isDoubtBox: true,
                          courseData: Courses(),
                          curriculumModel: CurriculumModel(),
                          courseId: courseId,
                          sectionId: sectionData?.sessionId ?? '',
                          title: sectionData?.title ?? 'Title',
                        ),
                      );
                    },
                    itemCount: doubtBoxState
                            .doubtBoxSectionModel.sectionData?.length ??
                        0,
                  ),
                ],
              );
            } else if (doubtBoxState is DoubtBoxFailed) {
              return CustomErrorWidget(
                errorMessage: doubtBoxState.errorMessage,
                onPressed: () {
                  ref
                      .read(doubtBoxViewModelProvider(courseId).notifier)
                      .fetchDoubtBoxSections(courseId: courseId);
                },
              );
            } else {
              return ShimmerCard(
                width: context.screenWidth,
                height: context.screenHeight * 0.4,
                borderRadius: 16,
              );
            }
          },
        ),
      ),
    );
  }
}
