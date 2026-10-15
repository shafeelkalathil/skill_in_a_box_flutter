import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class ExpandableText extends ConsumerWidget {
  ExpandableText({required this.text, super.key});
  final String text;
  final expansionProvider = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(expansionProvider);
    if (text.length <= 300) {
      return Text(
        text,
        style: subtitle2.copyWith(color: silverChalice.shade700),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded ? text : '${text.substring(0, 300)}...',
          style: subtitle2.copyWith(color: silverChalice.shade700),
        ),
        GestureDetector(
          onTap: () {
            ref.read(expansionProvider.notifier).update((value) => !isExpanded);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Text(
                  isExpanded ? 'Show Less' : 'View More',
                  style: heading4.copyWith(color: orange),
                ),
                const SizedBox(
                  width: 8,
                ),
                Transform.rotate(
                  angle: isExpanded ? pi : 0,
                  child: SvgPicture.asset(
                    Assets.icons.arrowDownInButton,
                    width: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
