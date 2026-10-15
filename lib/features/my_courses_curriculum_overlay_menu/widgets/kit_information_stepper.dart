import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class KitInformationStepper extends StatelessWidget {
  const KitInformationStepper({
    required this.activeStep, super.key,
  });

  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      lineStyle: LineStyle(
        lineType: LineType.dashed,
        defaultLineColor: const Color(0xff556068),
        activeLineColor: const Color(0xff556068),
        finishedLineColor: orange.shade500,
        lineLength: context.screenWidth * 0.15,
      ),
      finishedStepBackgroundColor: Colors.transparent,
      defaultStepBorderType: BorderType.normal,
      activeStepBorderColor: orange.shade500,
      activeStep: activeStep,
      activeStepTextColor: orange.shade500,
      finishedStepTextColor: orange.shade500,
      internalPadding: 20,
      showLoadingAnimation: false,
      enableStepTapping: false,
      showScrollbar: false,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: activeStep == 0
              ? SvgPicture.asset(Assets.images.processingActiveStep)
              : SvgPicture.asset(Assets.images.processingActiveStep),
          title: 'Processing',
        ),
        EasyStep(
          customStep:  activeStep > 1
              ? SvgPicture.asset(Assets.images.transitActiveStep)
              :SvgPicture.asset(Assets.images.transitStep),
          title: 'Transit',
        ),
        EasyStep(
          customStep: activeStep > 2
              ? SvgPicture.asset(Assets.images.deliveredActiveStep)
              :SvgPicture.asset(Assets.images.deliveredStep),
          title: 'Delivered',
        ),
      ],
    );
  }
}
