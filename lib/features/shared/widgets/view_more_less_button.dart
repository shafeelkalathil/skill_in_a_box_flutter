import 'package:flutter/material.dart';

import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class ViewMoreLessWidget extends StatelessWidget {

  const ViewMoreLessWidget({
    required this.textData, required this.type, required this.onSeeMoreLessTap,
    super.key,
  });
  final String textData;
  final int type;
  final VoidCallback onSeeMoreLessTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: InkWell(
          onTap: onSeeMoreLessTap,
          child: Text(
            textData,
            style: heading4.copyWith(color: orange.shade500),
          ),
        ),
      ),
    );
  }
}
