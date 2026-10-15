import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class NoNotesWidget extends StatelessWidget {
  const NoNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: context.screenHeight * 0.1),
          child: SvgPicture.asset(
            Assets.icons.paper,
            width: context.screenHeight * 0.3,
          ),
        ),
        Text(
          'No Notes',
          style: heading1.copyWith(color: silverChalice.shade900),
        ),
      ],
    );
  }
}
