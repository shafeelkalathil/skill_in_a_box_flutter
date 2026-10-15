import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/view_more_less.dart';

class CustomOverViewContent extends StatefulWidget {
  const CustomOverViewContent({
    required this.title,
    required this.subTitleContent,
    this.iconWidget = const SizedBox(),
    this.subTitleHeading = const [''],
    this.isShowIcon = false,
    this.isShowViewMoreButton = true,
    super.key,
  });

  final String title;
  final List<String> subTitleHeading;
  final List<String> subTitleContent;
  final Widget iconWidget;
  final bool isShowIcon;
  final bool isShowViewMoreButton;

  @override
  State<CustomOverViewContent> createState() => _CustomOverViewContentState();
}

class _CustomOverViewContentState extends State<CustomOverViewContent> {
  bool checkViewMore = false;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: heading3.copyWith(color: dark
                ? Colors.white:silverChalice.shade900,),),
        const SizedBox(height: 15,),
        CustomViewMoreLess(
            subTitleHeading: widget.subTitleHeading,
            subTitleContent: widget.subTitleContent,
            iconWidget: widget.iconWidget,
            isShowIcon: widget.isShowIcon,),
      ],
    );
  }
}
