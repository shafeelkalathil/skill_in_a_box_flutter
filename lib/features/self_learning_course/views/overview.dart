import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/overview_content.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

  List<String> whatYouGetSubTitleHeading = [
    'Design Expertise:',
    'Technical Skills:',
    'Portfolio Development:',
  ];
  List<String> whatYouGetSubTitleContent = [
    ' Acquire a deep understanding of design concepts, techniques, and processes, enabling you to create innovative and aesthetically pleasing fashion collections.',
    ' Develop practical skills in sketching, pattern drafting, sewing, draping, and garment construction, honing your ability to bring your design concepts to life.',
    ' Build a professional portfolio showcasing your design projects, demonstrating your creativity, technical proficiency, and unique design style to potential employers, clients, or fashion schools.',
  ];

  List<String> courseRequirementSubTitleHeading = [
    'Basic Drawing Skills:',
    'Sewing Skills (Optional):',
    'Creativity and Passion:',
  ];
  List<String> courseRequirementSubTitleContent = [
    ' While not mandatory, having basic drawing skills or a willingness to learn sketching techniques will enhance your ability to communicate design ideas visually.',
    ' Basic knowledge of sewing or a willingness to learn sewing techniques will be advantageous, especially for hands-on garment construction projects. The course may include sewing workshops for beginners.',
    ' A strong passion for fashion and a creative mindset are fundamental prerequisites for this course.',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
          child: Text('Course Details',style: heading1.copyWith(color: silverChalice.shade900),),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomOverViewContent(
                  title: 'Description',
                  subTitleContent: ['Fashion Designing is an in-depth and comprehensive course designed for individuals passionate about expressing their creativity through clothing and accessories. This course delves into the multifaceted aspects of fashion design, covering everything from conceptualization and sketching to garment construction and presentation. Through a combination of theoretical '],
                ),
                const SizedBox(height: 15,),
                CustomOverViewContent(
                  title: 'What You’ll Get',
                  subTitleHeading: whatYouGetSubTitleHeading,
                  subTitleContent:whatYouGetSubTitleContent,
                  isShowIcon: true,
                  iconWidget: SvgPicture.asset(Assets.icons.tick),
                ),
                const SizedBox(height: 15,),
                CustomOverViewContent(
                  title: 'Course Requirements',
                  subTitleHeading: courseRequirementSubTitleHeading,
                  subTitleContent:courseRequirementSubTitleContent,
                  isShowIcon: true,
                  iconWidget: CircleAvatar(
                    radius: 5,
                    backgroundColor: orange.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
