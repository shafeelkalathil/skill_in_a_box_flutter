import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_footer.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_header.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/signup_form.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.06,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.screenHeight * 0.08,
                ),
                const AuthHeader(
                  title: 'Create An Account',
                  subTitle: 'Create your account. It takes less than a minute.',
                ),
                const SignupForm(),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                AuthFooter(
                  title: 'Already have an account? ',
                  buttonTitle: 'Sign in',
                  onTap: () {
                    context.router.push(const SignInRoute());
                  },
                ),
                SizedBox(
                  height: context.screenHeight * 0.08,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
