import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({required this.title, required this.subTitle, super.key});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              dark ? Assets.images.logoDarkmode : Assets.images.logo,
              height: context.screenHeight * 0.05,
            ),
          ],
        ),
        SizedBox(
          height: context.screenHeight * 0.07,
        ),
        Text(
          title,
          style: heading1.copyWith(color: dark
              ? Colors.white
              :silverChalice.shade900,),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Text(
          subTitle,
          style: heading4.copyWith(
            color: dark
                ? const Color(0xffD3D3D3)
                :silverChalice.shade500,
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.06,
        ),
      ],
    );
  }
}
