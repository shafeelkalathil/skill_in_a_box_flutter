import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/core/utils/validators/validators.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/security_model/password_reset_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/security_view_model/security_states.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/security_view_model/security_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';

final newPasswordProvider = StateProvider<String>((ref) => '');

@RoutePage()
class SecurityScreen extends ConsumerStatefulWidget {
  const SecurityScreen({super.key});

  @override
  ConsumerState<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends ConsumerState<SecurityScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passObscureText = false;

  @override
  Widget build(BuildContext context) {
    final dark =  AppHelpers.isDarkMode(context);
    final state = ref.watch(securityViewModelNotifier);
    ref.listen(securityViewModelNotifier, (previous, current) {
      if (current is SecurityFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage,
            ),
            backgroundColor: red.shade500,
          ),
        );
      } else if (current is SecuritySuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Password updated successfully',
            ),
            backgroundColor: forestGreen,
          ),
        );
      }
    });
    return Scaffold(
      appBar: const CustomAppBar(title: 'Security'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.06),
            child: Container(
          width: context.screenWidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: dark ? const Color(0xff2C2C2E) : const Color(0xffE7E7E7),
              ),
              color:  dark
                  ? Colors.transparent : Colors.white,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.06,vertical: 20,),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Change Password',
                      style: heading2.copyWith(color: dark
                          ? Colors.white:silverChalice.shade700,),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    CustomTextField(
                      controller: currentPasswordController,
                      hintText: 'Current Password',
                      suffixIcon: const Icon(
                        Iconsax.eye,
                        size: 18,
                      ),
                      validator: AppValidators.validatePassword,
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    CustomTextField(
                      controller: newPasswordController,
                      onChanged: (value) {
                        onChangingPassword(value, ref);
                      },
                      hintText: 'New Password',
                      suffixIcon: const Icon(
                        Iconsax.eye,
                        size: 18,
                      ),
                      validator: AppValidators.validatePassword,
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    CustomTextField(
                      controller: confirmPasswordController,
                      validator: (value) =>
                          AppValidators.confirmNewPassword(value, ref),
                      hintText: 'Confirm Password',
                      suffixIcon: const Icon(
                        Iconsax.eye,
                        size: 18,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.04),
                    Center(
                      child: state is SecurityLoading
                          ? CircularProgressIndicator(
                              color: orange,
                            )
                          : SizedBox(
                              width: context.screenWidth * 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final updatedPassword = PassWordResetModel(
                                      password: currentPasswordController.text,
                                      newPassword: newPasswordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                    );
                                    ref
                                        .read(
                                            securityViewModelNotifier.notifier,)
                                        .updatePassword(updatedPassword);
                                  }
                                },
                                child: const Text('Update Password'),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onChangingPassword(String password, WidgetRef ref) {
    ref.read(newPasswordProvider.notifier).state = password;
  }
}
