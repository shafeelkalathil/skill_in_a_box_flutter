import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class EventItemsMenu extends StatelessWidget {
  const EventItemsMenu({required this.text, required this.widget, super.key});
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: widget,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: subtitle2.copyWith(color: silverChalice.shade700),
          ),
        ),
      ],
    );
  }
}
