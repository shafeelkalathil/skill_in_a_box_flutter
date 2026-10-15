import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

PreferredSizeWidget customAppBarWithTabView({
  required String title,
  required List<Widget> tabs,
  required BuildContext context,
}) {
  return AppBar(
    elevation: 1,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.black,
    leadingWidth: 300,
    leading: Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.backArrow,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: heading1.copyWith(color: silverChalice.shade900),
          ),
        ],
      ),
    ),
    bottom: TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(right: context.screenWidth * 0.2),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: orange.shade500,
        ),
        insets: const EdgeInsets.symmetric(horizontal: 16),
      ),
      tabs: tabs,
    ),
  );
}
