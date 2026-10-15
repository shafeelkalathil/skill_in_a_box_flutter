import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_footer.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_header.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/signin_form.dart';


@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                    vertical: context.screenWidth * 0.08,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthHeader(
                        title: 'Login to Your Account',
                        subTitle: 'Please enter your login details.',
                      ),
                      SignInForm(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.screenWidth * 0.05),
              child: AuthFooter(
                title: 'Don’t have an account? ',
                buttonTitle: 'Sign up',
                onTap: () {
                  context.router.push(const SignupRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
