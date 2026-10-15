import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/core/utils/validators/validators.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_state.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(
  );
  TextEditingController passwordController = TextEditingController(
  );

  bool passObscureText = false;

  Future<void> login
      (String email, String password, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await ref.read(authViewModelProvider.notifier)
          .login(email, password, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<AuthState>(authViewModelProvider, (previous, next) {
    //   if (next is AuthSuccess) {
    //     context.router.pushAndPopUntil(
    //       NavigationRoute(
    //         navItems: {
    //           'Home': Assets.icons.home,
    //           'Courses': Assets.icons.course,
    //           'Events': Assets.icons.events,
    //           'My Courses': Assets.icons.mycourse,
    //           'My Events': Assets.icons.myevents,
    //         },
    //         screens: const [
    //           CustomNavBarScreen(screen: HomeScreen()),
    //           CustomNavBarScreen(screen: CoursesScreen()),
    //           CustomNavBarScreen(screen: EventScreen()),
    //           CustomNavBarScreen(screen: MyCoursesScreen()),
    //           CustomNavBarScreen(screen: MyEventsScreen()),
    //         ],
    //       ),
    //       predicate: (route) => false,
    //     );
    //   }
    // });

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            hintText: 'Enter your email',
            validator: AppValidators.validateEmail,
          ),
          SizedBox(height: context.screenHeight * 0.015),
          CustomTextField(
            controller: passwordController,
            hintText: 'Enter your password',
            validator: AppValidators.validatePassword,
            obscureText: passObscureText,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(4),
              child: passObscureText
                  ? SvgPicture.asset(Assets.icons.hideEye)
                  : const Icon(Iconsax.eye),
            ),
            suffixOnTap: () {
              setState(() {
                passObscureText = !passObscureText ;
              });
            },
          ),
          SizedBox(height: context.screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      context.router.push(const ForgotPassRoute());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: heading4.copyWith(
                        color: const Color(0xff20C4F4),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.04),
          Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authViewModelProvider);
              return SizedBox(
                width: context.screenWidth * 0.9,
                height: 44,
                child: authState is AuthLoading
                    ? Center(child: CircularProgressIndicator(
                  color: orange.shade500,),)
                    : ElevatedButton(
                  onPressed: () {
                    login(
                      emailController.text,
                      passwordController.text,
                      context,);
                  },
                  child: const Text('Sign In'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
