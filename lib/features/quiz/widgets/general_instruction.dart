import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/bullet_text.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';

class GeneralInstruction extends StatelessWidget {
  const GeneralInstruction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('General Instructions',
            style: heading2.copyWith(color: dark
                ? Colors.white:silverChalice.shade700,),),),
          const SizedBox(height: 30,),
          CustomIconWithText(
            subTitleContent: 'The countdown timer set at the top right '
                'corner of your screen '
                'displays the time remaining for the completion of the test.',
            isShowIcon: true,
            iconWidget: CircleAvatar(
              backgroundColor: orange.shade500,radius: 5,),
          ),
          const SizedBox(height: 5,),
          CustomIconWithText(
            subTitleContent: 'The countdown timer set at the top right '
                'corner of your screen '
                'displays the time remaining for the completion of the test.',
            isShowIcon: true,
            iconWidget: CircleAvatar(
              backgroundColor: orange.shade500,radius: 5,),
          ),
        ],
      ),
    );
  }
}
