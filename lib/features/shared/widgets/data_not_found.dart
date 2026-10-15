import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomDataNotFound extends StatelessWidget {
  const CustomDataNotFound({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    super.key,
  });
  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(imageUrl),
          SizedBox(
            height: context.screenHeight*0.04,
          ),
          Text(
            title,
            style: heading3.copyWith(
              color: dark ? Colors.white : silverChalice.shade900,
            ),
          ),
           SizedBox(
            height: context.screenHeight*0.02,
          ),
          Text(
            subTitle,
            style: subtitle2.copyWith(
              color: dark ? const Color(0xffD3D3D3) : silverChalice.shade500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
