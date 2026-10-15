
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/validators/validators.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_state.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_view_model.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_footer.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_header.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';

@RoutePage()
class ForgotPassScreen extends ConsumerStatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  ConsumerState<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends ConsumerState<ForgotPassScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  Future<dynamic> sendCode(String email,BuildContext context) async{
    if(formKey.currentState!.validate()){
      await ref.read(authViewModelProvider.notifier)
          .forgotPassword(email, context);
    }
  }
  @override
  Widget build(BuildContext context) {

    // ref.listen<AuthState>(authViewModelProvider, (previous, next) {
    //   if (next is AuthSuccess) {
    //     context.router.push(
    //         OtpVerificationRoute(
    //           email: emailController.text,
    //         )
    //     );
    //   }
    // });

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                    vertical: context.screenWidth * 0.08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeader(
                        title: 'Forgot Password?',
                        subTitle: "Don't worry! It occurs. Please enter the "
                            'email address  linked with your account.',
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: emailController,
                              hintText: 'Enter your email',
                              validator: AppValidators.validateEmail,
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.025,
                            ),
                            Consumer(
                              builder: (context, ref, child) {
                                final authState = ref.watch(
                                    authViewModelProvider,);
                                return SizedBox(
                                  width: context.screenWidth * 0.9,
                                  height: 44,
                                  child: authState is AuthLoading
                                      ? Center(child: CircularProgressIndicator(
                                    color: orange.shade500,),)
                                      : ElevatedButton(
                                    onPressed: () {
                                      sendCode(emailController.text,context);
                                    },
                                    child: const Center(
                                      child: Text('Send Code'),
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
            Padding(
              padding: EdgeInsets.only(bottom: context.screenWidth * 0.05),
              child:  AuthFooter(
                title: 'Remember Password? ',
                buttonTitle: 'Sign in',
                onTap: () {
                  context.router.push(const SignInRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
