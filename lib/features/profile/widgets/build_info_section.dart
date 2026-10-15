import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';

class BuildInfoSection extends StatefulWidget {
  const BuildInfoSection({
    required this.title,
    required this.hintText,
    required this.isEdit,
    required this.controller,
    this.isCountryDropDown = false,
    this.isReadOnly = false,
    this.validator,
    this.suffixOnTap,
    this.onTap,
    this.suffixIcon,
    this.selectedCountry,
    this.isPhoneNo = false,
    super.key,
  });

  final String title;
  final String hintText;
  final bool isEdit;
  final bool isCountryDropDown;
  final bool isReadOnly;
  final bool isPhoneNo;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? suffixOnTap;
  final VoidCallback? onTap;
  final Country? selectedCountry;
  final Widget? suffixIcon;

  @override
  BuildInfoSectionState createState() => BuildInfoSectionState();
}

class BuildInfoSectionState extends State<BuildInfoSection> {
  late Country displayCountry;

  @override
  void initState() {
    super.initState();
    displayCountry = widget.selectedCountry ??
        Country(
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
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: subtitle2.copyWith(color: silverChalice.shade600),
        ),
        const SizedBox(height: 6),
        if (widget.isEdit)
          SizedBox(
            height: 44,
            child: widget.isPhoneNo
                ? CustomPhoneField(controller: widget.controller,)
                : widget.isCountryDropDown
                ? CountryPickerField(
              controller: widget.controller,
              initialCountry: displayCountry,
            )
                : CustomTextField(
              readOnly: widget.isReadOnly,
              hintText: '',
              controller: widget.controller,
              onTap: widget.onTap,
              suffixIcon: widget.suffixIcon,
              suffixOnTap: widget.suffixOnTap,
            ),
          )
        else
          Text(
            widget.controller.text.isEmpty ? '-' : widget.controller.text,
            style: heading3.copyWith(color: dark
                ? const Color(0xffD3D3D3):silverChalice.shade800,),
          ),
        const SizedBox(height: 18),
      ],
    );
  }

  
}
