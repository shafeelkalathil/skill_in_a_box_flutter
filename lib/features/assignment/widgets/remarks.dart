import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';

class Remarks extends StatelessWidget {
  const Remarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.screenHeight * 0.025,
        ),
        Text(
          'Remarks',
          style: heading3.copyWith(color: silverChalice.shade700),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        RoundedContainer(
          widget: Text(
            'Good Work, Keep it up',
            style: subtitle2.copyWith(color: silverChalice.shade400),
          ),
        ),
      ],
    );
  }
}
