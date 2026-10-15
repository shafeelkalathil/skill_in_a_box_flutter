import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Recordings'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.screenWidth * 0.06,
            right: context.screenWidth * 0.06,
            top: context.screenWidth * 0.06,
          ),
          child: CustomGridView(
            itemLength: 10,
            itemBuilder: (context, index) {
              return RoundedContainer(
                isPadding: false,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: context.screenHeight * 0.01),
                    Stack(
                      children: [
                        SvgPicture.asset(Assets.images.record),
                        Center(child: Image.asset(Assets.images.computer.path)),
                      ],
                    ),
                    Text(
                      'Session $index',
                      style: heading3.copyWith(
                        fontSize: 14,
                        color: dark ? Colors.white : silverChalice.shade900,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.calender,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'May 11,2024',
                          style: heading4.copyWith(
                            color: dark
                                ? const Color(0xffD3D3D3)
                                : silverChalice.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
