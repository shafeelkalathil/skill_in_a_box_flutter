import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

// ignore: must_be_immutable
class LanguageButton extends StatefulWidget {
   LanguageButton({
    required this.languages,
    required this.selectedLanguage,
    super.key,
  });
  final List<String> languages;
  late  String selectedLanguage;
  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SizedBox(
      width: _calculateTextWidth(widget.selectedLanguage)+80,
      child: ExpansionTile(
        visualDensity: const VisualDensity(vertical: -2),
        controller: controller,
        title: Center(
          child: Text(
            widget.selectedLanguage,
            style: subtitle2.copyWith(color: dark
                ? const Color(0xffA7A9AC) :silverChalice.shade900,),
          ),
        ),
        collapsedIconColor: orange,
        collapsedBackgroundColor: const Color(0xffffffff),
        backgroundColor: dark
            ? const Color(0xff2C2C2E): const Color(0xffffffff),
        leading: SvgPicture.asset(
          Assets.icons.internet,
          width: 22,
        ),
        dense: true,
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        children: widget.languages
            .map(
              (language) => ListTile(
            dense: true,
            title: Text(language),
            titleTextStyle:
            subtitle2.copyWith(color: silverChalice.shade900),
            selected: widget.selectedLanguage == language,
            selectedColor: orange,
            onTap: () {
              controller.collapse();
              setState(() {
                widget.selectedLanguage = language;
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
