import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({required this.activeStep, super.key});
  final int activeStep;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return EasyStepper(
      lineStyle: LineStyle(
        lineType: LineType.normal,
        defaultLineColor: dark ? Colors.white :const Color(0xff556068),
        activeLineColor: dark ? Colors.white :const Color(0xff556068),
        finishedLineColor: orange.shade500,
        lineLength: context.screenWidth * 0.2,
      ),
      finishedStepBackgroundColor: orange.shade500,
      defaultStepBorderType: BorderType.normal,
      activeStepBorderColor: orange.shade500,
      activeStep: widget.activeStep,
      activeStepTextColor: orange.shade500,
      finishedStepTextColor: dark ? Colors.white : const Color(0xff556068),
      internalPadding: 20,
      showLoadingAnimation: false,
      stepRadius: 15,
      enableStepTapping: false,
      borderThickness: 3,
      steps: [
        EasyStep(
          customStep:widget.activeStep > 0
              ? SvgPicture.asset(Assets.icons.tickCircle)
              : Center(
            child: Text( '1', // Show tick if step is completed
              style: TextStyle(color: dark ? Colors.white :Colors.black),
            ),
          ),
          title: 'Basic Details',
        ),
        EasyStep(
          customStep:  widget.activeStep > 1
              ? SvgPicture.asset(Assets.icons.tickCircle)
              : Center(
            child: Text(
              '2', // Show tick if step is completed
              style: TextStyle(color: dark ? Colors.white :Colors.black),
            ),
          ),
          title: 'Address',
        ),
        EasyStep(
          customStep:  widget.activeStep > 2
              ? SvgPicture.asset(Assets.icons.tickCircle)
              : Center(
            child: Text(
              '3', // Show tick if step is completed
              style: TextStyle(color: dark ? Colors.white :Colors.black),
            ),
          ),
          title: 'Payment',
        ),
      ],
    );
  }
}
