import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.bottomWidget,
    this.backgroundColor,
    this.trailing,
  });
  final String title;
  final PreferredSizeWidget? bottomWidget;
  final Color? backgroundColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final hasDrawer = Scaffold.of(context).hasDrawer;
    final canPop = Navigator.of(context).canPop();
    final dark =AppHelpers.isDarkMode(context);
    return AppBar(
      title: Text(
        title,
        style: heading1.copyWith(color: dark
            ? Colors.white
            : silverChalice.shade900,),
      ),
      actions: [trailing ?? const SizedBox.shrink()],
      surfaceTintColor: Colors.transparent,
      shadowColor:
          bottomWidget != null ? silverChalice.shade100.withOpacity(0.5) : null,
      elevation: bottomWidget != null ? 1 : null,
      backgroundColor: backgroundColor,
      titleSpacing:
          canPop ? context.screenWidth * 0.02 : context.screenWidth * 0.06,
      leading: leadingIcon(context,
          hasDrawer: hasDrawer, canPop: canPop,dark: dark,),
      bottom: bottomWidget,
    );
  }

  Widget? leadingIcon(
    BuildContext context,{
    required bool hasDrawer,
    required bool canPop,
    required bool dark,
  }) {
    if (canPop) {
      return Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.03,
        ),
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(Assets.icons.backArrow, width: 24, color: dark ? Colors.white :null,),
        ),
      );
    }
    if (hasDrawer) {
      return Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.03,
        ),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: silverChalice.shade100,
          ),
        ),
      );
    }
    return null;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottomWidget != null ? 100 : kToolbarHeight);
}
