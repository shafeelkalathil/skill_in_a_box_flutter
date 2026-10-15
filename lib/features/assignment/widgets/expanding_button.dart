import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class ExpandingButton extends StatefulWidget {
  const ExpandingButton({
    required this.languges,
    super.key,
  });
  final List<String> languges;
  @override
  State<ExpandingButton> createState() => _ExpandingButtonState();
}

class _ExpandingButtonState extends State<ExpandingButton> {
  String selectedLanguage = 'English';
  ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SizedBox(
      width: _calculateTextWidth(selectedLanguage)+80,
      child: ExpansionTile(
        visualDensity: const VisualDensity(vertical: -2),
        controller: controller,
        title: Center(
          child: Text(
            selectedLanguage,
            style: subtitle2.copyWith(color: dark
                ? const Color(0xffD3D3D3):silverChalice.shade900,),
          ),
        ),
        collapsedIconColor: orange,
        collapsedBackgroundColor: dark
            ? const Color(0xff222223):const Color(0xffffffff),
        backgroundColor: dark
            ? const Color(0xff222223): const Color(0xffffffff),
        leading: SvgPicture.asset(
          Assets.icons.internet,
          width: 22,
        ),
        dense: true,
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        children: widget.languges
            .map(
              (language) => ListTile(
                dense: true,
                title: Text(language),
                titleTextStyle:
                    subtitle2.copyWith(color: silverChalice.shade900),
                selected: selectedLanguage == language,
                selectedColor: orange,
                onTap: () {
                  controller.collapse();
                  setState(() {
                    selectedLanguage = language;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  double _calculateTextWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: subtitle2),
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }
}
