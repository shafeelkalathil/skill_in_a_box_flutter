import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/validators/validators.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_state.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_view_model.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_header.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class NewPassWordScreen extends ConsumerStatefulWidget {
  const NewPassWordScreen({
    required this.email,
    required this.otp,
    super.key,
  });
  final String email;
  final String otp;

  @override
  ConsumerState<NewPassWordScreen> createState() => _NewPassWordScreenState();
}

class _NewPassWordScreenState extends ConsumerState<NewPassWordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passObscureText = false;
  bool confirmPassObscureText = false;

  Future<dynamic> resetPassword(
      String email, String otp, String password, BuildContext context,) async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(authViewModelProvider.notifier)
          .resetPassword(email, otp, password, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<AuthState>(authViewModelProvider, (previous, next) {
    //   if (next is AuthSuccess) {
    //     context.router.push(
    //       const PassWordChangeSuccessRoute(),
    //     );
    //   }
    // });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.08),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  title: 'Create New Password',
                  subTitle: 'Your new'
                      ' password must be unique from those previously used.',
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        obscureText: passObscureText,
                        controller: newPasswordController,
                        hintText: 'New Password',
                        validator: AppValidators.validatePassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(4),
                          child: passObscureText
                              ? SvgPicture.asset(Assets.icons.hideEye)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixOnTap: () {
                          setState(() {
                            passObscureText = !passObscureText;
                          });
                        },
                      ),
                      SizedBox(height: context.screenHeight * 0.015),
                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required';
                          }
                          if (value != newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                      
                        },
                        obscureText: confirmPassObscureText,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(4),
                          child: confirmPassObscureText
                              ? SvgPicture.asset(Assets.icons.hideEye)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixOnTap: () {
                          setState(() {
                            confirmPassObscureText = !confirmPassObscureText;
                          });
                        },
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.025,
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final authState = ref.watch(
                            authViewModelProvider,
                          );
                          return SizedBox(
                            width: context.screenWidth * 0.9,
                            height: 44,
                            child: authState is AuthLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: orange.shade500,
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      resetPassword(
                                        widget.email,
                                        widget.otp,
                                        confirmPasswordController.text,
                                        context,
                                      );
                                    },
                                    child: const Center(
                                      child: Text('Reset Password'),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ],
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
