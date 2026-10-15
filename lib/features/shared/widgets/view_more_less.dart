import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/bullet_text.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/view_more_less_button.dart';

class CustomViewMoreLess extends StatefulWidget {
  const CustomViewMoreLess({
    required this.subTitleHeading,
    required this.subTitleContent,
    required this.iconWidget,
    required this.isShowIcon,
    this.isShowViewMoreButton = true,
    super.key,
  });

  final List<String> subTitleHeading;
  final List<String> subTitleContent;
  final Widget iconWidget;
  final bool isShowIcon;
  final bool isShowViewMoreButton;

  @override
  State<CustomViewMoreLess> createState() => _CustomViewMoreLessState();
}

class _CustomViewMoreLessState extends State<CustomViewMoreLess> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        if (widget.isShowViewMoreButton)
          ExpandableWidget(
            content: List.generate(
              widget.subTitleContent.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomIconWithText(
                    subTitleContent: widget.subTitleContent[index],
                    subTitleHeading: widget.subTitleHeading.isNotEmpty
                        ? widget.subTitleHeading[index]
                        : '',
                    iconWidget: widget.iconWidget,
                    isShowIcon: widget.isShowIcon,
                  ),
                );
              },
            ),
          ),
        if (!widget.isShowViewMoreButton)
          ...List.generate(
            widget.subTitleContent.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CustomIconWithText(
                  subTitleContent: widget.subTitleContent[index],
                  subTitleHeading: widget.subTitleHeading[index],
                  iconWidget: widget.iconWidget,
                  isShowIcon: widget.isShowIcon,
                ),
              );
            },
          ),
      ],
    );
  }
}

class ExpandableWidget extends StatelessWidget {
  ExpandableWidget({
    required this.content,
    super.key,
  });
  final List<Widget> content;

  final ValueNotifier<bool> expanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, isExpanded, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRect(
                      child: Align(
                        alignment: Alignment.topLeft,
                        heightFactor: isExpanded ? null : 0.5,
                        child: Column(
                          children: content,
                        ),
                      ),
                    ),
                    ViewMoreLessWidget(
                      textData: isExpanded ? 'Show Less' : 'View More',
                      type: isExpanded ? 2 : 1,
                      onSeeMoreLessTap: () {
                        expanded.value = !isExpanded;
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
