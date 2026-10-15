import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/phone_number_view_model/phone_number_view_model.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.suffixOnTap,
    this.prefixOnTap,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    super.key,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? suffixOnTap;
  final VoidCallback? prefixOnTap;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SizedBox(
      height: validator != null ? null : 44,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: subtitle2.copyWith(color: dark
            ? orange.shade500
            : silverChalice.shade800,),
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: readOnly
              ? (dark ? const Color(0xff222223) : silverChalice.shade100)
              : (dark ? const Color(0xff333333) : Colors.transparent),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: suffixOnTap,
                    child: suffixIcon,
                  ),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: prefixOnTap,
                    child: prefixIcon,
                  ),
                )
              : null,
        ),
        onTap: onTap,
        readOnly: readOnly,
      ),
    );
  }
}

class CustomPhoneField extends ConsumerWidget {
  const CustomPhoneField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = AppHelpers.isDarkMode(context);
    return IntlPhoneField(
      controller: controller,
      dropdownIconPosition: IconPosition.trailing,
      style: subtitle2.copyWith(color: silverChalice.shade800),
      flagsButtonMargin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        filled: dark,
        fillColor: dark ? const Color(0xff333333) : Colors.transparent,
      ),
      initialCountryCode: 'IN',
      onCountryChanged: (country) {
        ref.read(phoneNumberProvider.notifier).updatePhoneNumber(
              PhoneNumber(
                countryCode: country.dialCode,
                countryISOCode: country.code,
                number: controller.text,
              ),
            );
      },
      onChanged: (phoneNumber) {
        ref.read(phoneNumberProvider.notifier).updatePhoneNumber(phoneNumber);
      },
    );
  }
}

class CountryPickerField extends StatefulWidget {
  const CountryPickerField({
    required this.controller,
    required this.initialCountry,
    this.validator,
    super.key,
  });
  final TextEditingController controller;
  final Country initialCountry;
  final String? Function(String?)? validator;

  @override
  CountryPickerFieldState createState() => CountryPickerFieldState();
}

class CountryPickerFieldState extends State<CountryPickerField> {
  late Country displayCountry;

  @override
  void initState() {
    super.initState();
    displayCountry = widget.initialCountry;
    widget.controller.text = displayCountry.name;
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: widget.controller,
        style: subtitle2.copyWith(color: silverChalice.shade800),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.all(18),
            child: InkWell(
              child: SvgPicture.asset(Assets.icons.arrowDown),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(displayCountry.flagEmoji),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          filled: dark,
          fillColor: dark ? const Color(0xff333333) : Colors.transparent,
        ),
        readOnly: true,
        validator: widget.validator,
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: true,
            onSelect: (Country country) {
              setState(() {
                displayCountry = country;
                widget.controller.text = country.name;
              });
            },
          );
        },
      ),
    );
  }
}
