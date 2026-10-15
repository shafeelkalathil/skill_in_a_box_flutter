import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/my_courses_model/my_courses_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/expansion_tile.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/overview_content.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/video_player.dart';


@RoutePage()
class SelfLearningCourseScreen extends StatefulWidget {
  const SelfLearningCourseScreen({super.key});

  @override
  State<SelfLearningCourseScreen> createState() =>
      _SelfLearningCourseScreenState();
}

class _SelfLearningCourseScreenState extends State<SelfLearningCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 234,
              child: CustomMuxVideoPlayer(
                isRounded: false,
                assetId: '',
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.06,
                      vertical: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomOverViewContent(
                        title: 'Professional Fashion Designing',
                        subTitleContent: [
                          "Each learner must draft a basic bodice pattern's front and back in their own desired size and submit a minimum of three pictures for evaluation. the pictures must contain one flat laid picture of bodice front, one flat laid picture of bodice back and one picture of the learner holding the pattern themselves to prove the pattern was drafted by them and stolen from the internet.",
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'My Notes',
                        style: heading3.copyWith(color: silverChalice.shade900),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 44,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Add Notes',
                            suffixIcon: Icon(
                              Iconsax.add_circle,
                              color: orange.shade500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Resources',
                        style: heading3.copyWith(color: silverChalice.shade900),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

//should pass course and section id

                      CustomExpansionTile(
                         courseData: Courses(),
                        curriculumModel: CurriculumModel(),
                        courseId: '',
                        sectionId: '',
                        title: 'Threads',
                        
                      ),
                      const SizedBox(height: 12),
                      CustomExpansionTile(
                         courseData: Courses(),
                        curriculumModel: CurriculumModel(),
                        courseId: '',
                        sectionId: '',
                        title: 'Threads',
                       
                      ),
                      const SizedBox(height: 12),
                      CustomExpansionTile(
                        courseData: Courses(),
                        curriculumModel: CurriculumModel(),
                        courseId: '',
                        sectionId: '',
                        title: 'Threads',
                        
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
