import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.hintText});
  final String ? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: silverChalice.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: silverChalice.shade200,
            size: 19,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                isDense: true,
                hintText: 'Search Courses',
                hintStyle: body1.copyWith(color: silverChalice.shade200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
