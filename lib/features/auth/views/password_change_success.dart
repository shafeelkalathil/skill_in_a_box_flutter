import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class PassWordChangeSuccessScreen extends StatelessWidget {
  const PassWordChangeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.08,
              vertical: context.screenWidth * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.successMark,
                ),
                SizedBox(
                  height: context.screenHeight * 0.04,
                ),
                Text(
                  'Password Changed!',
                  style: heading1.copyWith(color: dark
                      ? Colors.white
                      : silverChalice.shade900,),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Your password has been changed ',
                    style: heading3.copyWith(
                      fontSize: 14,
                      color: dark
                          ? const Color(0xffD3D3D3)
                          :silverChalice.shade500,
                    ),
                    children: [
                      TextSpan(
                        text: 'successfully',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color: dark
                              ? const Color(0xffD3D3D3)
                              :silverChalice.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                SizedBox(
                  width: context.screenWidth * 0.9,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.pushAndPopUntil(
                        const SignInRoute(),
                        predicate: (route) => false,
                      );
                    },
                    child: const Center(
                      child: Text('Back to Login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
