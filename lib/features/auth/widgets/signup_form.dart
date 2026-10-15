import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/core/utils/validators/validators.dart';
import 'package:skill_in_a_box_flutter/features/auth/models/sign_up/student_model.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_state.dart';
import 'package:skill_in_a_box_flutter/features/auth/view_models/auth_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<String> items = ['','Male','Female'];
  String selectedValue = '';
  bool passObscureText = false;

  Country displayCountry = Country(
    name: 'India',
    countryCode: 'IN',
    phoneCode: '91',
    e164Sc: 91,
    geographic: true,
    level: 1,
    example: '9123456789',
    displayName: 'India (IN) +91',
    displayNameNoCountryCode: 'India',
    e164Key: 'IN-91',
  );

  Future<void> register
      (StudentModel studentData, BuildContext context) async {
    if (_formKey.currentState!.validate()) {

      if(phoneController.text == ''
          || phoneController.text.isEmpty){
        AppHelpers.showSnackBar(
          'Please enter phone number', context,);
      }else{
      await ref.read(authViewModelProvider.notifier)
          .register(studentData, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: firstNameController,
            hintText: 'First Name',
            validator: (value) {
              return AppValidators.textFieldValidator(value,
                  'firstName should not be empty',);
            },
          ),
          SizedBox(height: context.screenHeight * 0.015),
          CustomTextField(
            controller: lastNameController,
            hintText: 'Last Name',
            validator: (value) {
              return AppValidators.textFieldValidator(value,
                'lastName should not be empty',);
            },
          ),
          SizedBox(height: context.screenHeight * 0.015),
          CustomTextField(
              controller: emailController,
              hintText: 'Email',
              validator: AppValidators.validateEmail,
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Container(
            width: context.screenWidth *0.9,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: dark ? const Color(0xff222223) : Colors.white,
            ),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: selectedValue,
              items: items.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item,style: subtitle2.copyWith(
                    color: silverChalice.shade300,),),
              ),).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              icon: SvgPicture.asset(Assets.icons.arrowDown),
              hint: const Text('Select an option'),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.015),
          CustomPhoneField(controller: phoneController,),
          SizedBox(height: context.screenHeight * 0.015),
          CountryPickerField(
            controller: countryController,
            initialCountry: displayCountry,
            validator: (value) {
              return AppValidators.textFieldValidator(
                value, 'country should not be empty',);
            },
          ),
          SizedBox(height: context.screenHeight * 0.015),
          CustomTextField(
            controller: passwordController,
            hintText: 'Strong password',
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
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
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
                      final studentData = StudentModel(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        phoneNumber: phoneController.text,
                        country: countryController.text,
                        password: passwordController.text,
                        gender: selectedValue,
                      );
                      register(studentData, context);
                  },
                  child: const Center(
                    child: Text('Sign Up'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
