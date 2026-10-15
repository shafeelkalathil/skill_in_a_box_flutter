import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class LeaderBoardCard extends StatelessWidget {
  const LeaderBoardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.screenWidth *0.9,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: silverChalice.shade100,
            ),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('1'),
            SizedBox(
              width: context.screenWidth * 0.3,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(),
                  Text('data'),
                ],
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.3,
              child: Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                    color:  orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(Assets.icons.trophy),
                    const Text('22 Pts'),
                  ],
                ),
              ),
            ),
          ],
        ),);
  }
}
