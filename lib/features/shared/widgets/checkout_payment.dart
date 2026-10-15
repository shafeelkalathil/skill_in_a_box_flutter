import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/custom_stepper.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/priceandbutton.dart';

import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({required this.child, super.key});
  final Widget child;

  @override
  State createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int activeStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomStepper(
                        activeStep: activeStep,
                      ),
                      widget.child,
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.screenHeight * 0.03),
                child: BuildPriceAndButton(
                  price: '₹ 12,000',
                  buttonText: 'Save & Continue',
                  buttonWidth: context.screenWidth * 0.5,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
