import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/recording_model/recording_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class RecordingSuccessWidget extends StatelessWidget {
  const RecordingSuccessWidget({required this.recordingModel, super.key});
  final RecordingModel recordingModel;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenPadding),
          CustomGridView(
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
        ],
      ),
    );
  }
}
