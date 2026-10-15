import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class NotesTopSection extends StatelessWidget {
  const NotesTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Notes',
          style: heading2.copyWith(color: dark
              ? Colors.white : silverChalice.shade900,),
        ),
        SizedBox(
          width: 24,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.close,
              size: 24,
              color: dark ? Colors.white : silverChalice.shade900,
            ),
          ),
        ),
      ],
    );
  }
}
