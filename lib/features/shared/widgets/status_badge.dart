import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    required this.bgColor,
    required this.color,
    required this.value,
    super.key,
  });

  final Color bgColor;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius:4,
            backgroundColor: color,
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: heading4.copyWith(color:color,fontSize: 14),
          ),
        ],
      ),
    );
  }
}
