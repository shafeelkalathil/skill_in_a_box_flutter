import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_state.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_view_model.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_footer.dart';
import 'package:skill_in_a_box_flutter/features/auth/widgets/auth_header.dart';

import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';

@RoutePage()
class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({required this.email, super.key});
  final String email;

  @override
  ConsumerState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final focusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 22,
      color: silverChalice.shade900,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.13),
      border: Border.all(color: silverChalice.shade200),
    ),
  );

  final darkPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.13),
      border: Border.all(color: Colors.transparent),
      color: const Color(0xff2C2C2E),
    ),
  );

  Future<dynamic> verifyOtp(String email,String otp, BuildContext context) async {
    if(_formKey.currentState!.validate()){
      await ref.read(authViewModelProvider.notifier)
          .verifyOtp(email, otp, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final countdown = ref.watch(countdownProvider);
    final countdownNotifier = ref.read(countdownProvider.notifier);
    final dark = AppHelpers.isDarkMode(context);
    // ref.listen<AuthState>(authViewModelProvider, (previous, next) {
    //   if (next is AuthSuccess) {
    //     context.router.push(
    //       NewPassWordRoute(
    //         email: widget.email,
    //         otp: otpController.text,
    //       ),
    //     );
    //   }
    // });
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                        title: 'OTP Verification',
                        subTitle: 'Enter the verification code we just sent to '
                            'your email address.',
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                length: 6,
                                controller: otpController,
                                focusNode: focusNode,
                                defaultPinTheme: dark
                                    ? darkPinTheme
                                    :defaultPinTheme,
                                separatorBuilder: (index) =>
                                const SizedBox(width: 8),
                                validator: (value) {
                                  if(value!.length < 6){
                                    return 'Please enter otp';
                                  }
                                  return null;
                                },
                                hapticFeedbackType:
                                HapticFeedbackType.lightImpact,
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: silverChalice.shade200,
                                    ),
                                  ],
                                ),
                                focusedPinTheme: defaultPinTheme,
                                submittedPinTheme: defaultPinTheme,
                                errorPinTheme: defaultPinTheme,
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                      verifyOtp(
                                        widget.email,
                                        otpController.text,
                                        context,);
                                    },
                                    child: const Center(child: Text('Verify')),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          countdown > 0
                              ? 'Request new code in ${
                              countdownNotifier.formattedTime}'
                              : 'You can request a new code',
                          style: subtitle2.copyWith(
                            color: dark
                                ? Colors.white
                                : silverChalice.shade500,
                          ),
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
                title: 'Did’t receive code? ',
                buttonTitle: 'Resend',
                onTap: countdown == 0 ? countdownNotifier.resetTimer : () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}


///test code

final countdownProvider = StateNotifierProvider<CountdownNotifier, int>((ref) {
  return CountdownNotifier();
});

class CountdownNotifier extends StateNotifier<int> {
  // Initialize with 5 minutes (300 seconds)
  CountdownNotifier() : super(300) {
    startTimer();
  }

  Timer? _timer;

  // Start the countdown timer
  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--; // Decrease the timer by 1 second
      } else {
        _timer?.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  // Reset the timer back to 5 minutes
  void resetTimer() {
    state = 300;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Helper method to get formatted time as MM:SS
  String get formattedTime {
    final minutes = (state ~/ 60).toString().padLeft(2, '0');
    final seconds = (state % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

