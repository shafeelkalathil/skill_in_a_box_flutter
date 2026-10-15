import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class BottomSheetWithPrice extends StatelessWidget {
  const BottomSheetWithPrice({
    super.key,
    this.originalPrice,
    this.finalPrice,
    this.registrationPrice,
  });

  final String? originalPrice;
  final String? finalPrice;
  final String? registrationPrice;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
      ),
      width: context.screenWidth,
      height: context.screenHeight * 0.1,
      decoration: BoxDecoration(
        color: dark ? const Color(0xff222223) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: dark ? const Color(0xff222223) : silverChalice.shade100,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    finalPrice ?? 'Final Price',
                    style: heading1.copyWith(
                      color: orange.shade500,
                    ),
                  ),
                ),
                // const SizedBox(height: 4),
                if (originalPrice != null && originalPrice!.isNotEmpty)
                  FittedBox(
                    child: Text(
                      originalPrice!,
                      style: subtitle2.copyWith(
                        color: dark
                            ? const Color(0xffD3D3D3)
                            : silverChalice.shade400,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: dark
                            ? const Color(0xffD3D3D3)
                            : silverChalice.shade400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.router.push(CheckoutDetailsRoute());
              },
              child: Text(
                registrationPrice != null
                    ? 'Register with $registrationPrice'
                    : 'Purchase Now',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
