import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class QuizOption extends StatelessWidget {

   const QuizOption({
    required this.label,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
     required this.selectedBgColor,
     required this.selectedIcon,
     super.key,
  });
  final String label;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color selectedColor;
  final Color selectedBgColor;
  final Widget selectedIcon;


  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.only(top: 10),
      child: Container(
        // height: 54,
        // margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? selectedColor : silverChalice.shade400,
            width: 0.5,
          ),
          color: dark
              ? const Color(0xff2C2C2E):isSelected
              ? selectedBgColor : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: subtitle2.copyWith(
                color: dark
                    ? Colors.white: isSelected
                    ? selectedColor : silverChalice.shade700,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: subtitle2.copyWith(
                  color: dark ? Colors.white : isSelected
                      ? selectedColor
                      : silverChalice.shade700,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : silverChalice.shade400,
                  width: 1.67,
                ),
              ),
              child: isSelected
                  ? CircleAvatar(
                backgroundColor: selectedColor,
                radius: 10,
                child: Center(
                  child: selectedIcon,
                ),)
                  : const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 7.5,),
            ),
          ],
        ),
      ),),
    );
  }
}
