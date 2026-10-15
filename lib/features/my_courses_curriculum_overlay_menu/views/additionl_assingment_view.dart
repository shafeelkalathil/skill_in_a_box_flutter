import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class AdditionalAssessmentsScreen extends StatelessWidget {
  const AdditionalAssessmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Additional Assessments'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.06,),
              child: CustomGridView(
                itemLength: 4,
                itemBuilder: (context, index) {
                  return RoundedContainer(
                    isPadding: false,
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.images.additionAssingmentNoteBook,
                        ),
                        Text(
                          'Session $index',
                          style: heading3.copyWith(
                              fontSize: 14, color: dark
                              ? const Color(0xffD3D3D3)
                              :silverChalice.shade900,),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
}
