import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class PdfWidget extends StatelessWidget {
  const PdfWidget({required this.title, required this.link, super.key});
  final String title;
  final String link;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(PdfViewRoute(title: title, link: link));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.02,
          vertical: context.screenHeight * 0.01,
        ),
        width: context.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: silverChalice.shade100),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.pdfRed),
            SizedBox(
              width: context.screenWidth * 0.04,
            ),
            SizedBox(
              width: context.screenWidth*0.55,
              child: Text(
                title,
                style: heading4.copyWith(color: silverChalice.shade700),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
