import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';


class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    required this.widget,
    super.key,
    this.isPadding = true,
    this.isSymmetricPadding = false,
    this.borderColor = const Color(0xffE7E7E7),
    this.darkModeBorderColor = const Color(0xff222223),
    this.bgColor = Colors.white,
  });

  final Widget widget;
  final bool isPadding;
  final Color borderColor;
  final Color darkModeBorderColor;
  final Color bgColor;
  final bool isSymmetricPadding;

  @override
  Widget build(BuildContext context) {
    final  dark = AppHelpers.isDarkMode(context);
    return Container(
      width: context.screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: dark ? darkModeBorderColor : borderColor,
        ),
        color:  dark && bgColor == Colors.white
            ? const Color(0xff2C2C2E) : bgColor,
      ),
      padding: isSymmetricPadding
          ? EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06)
          : EdgeInsets.all(isPadding ? context.screenWidth * 0.06 : 0),
      child: widget,
    );
  }
}
