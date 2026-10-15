import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/custom_stepper.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/sections.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class CheckoutDetailsScreen extends StatefulWidget {
  const CheckoutDetailsScreen({super.key, this.showShipmentAddress = false});
  final bool showShipmentAddress;

  @override
  State<CheckoutDetailsScreen> createState() => _CheckoutDetailsScreenState();
}

class _CheckoutDetailsScreenState extends State<CheckoutDetailsScreen> {
  int activeStep = 0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      dateOfBirthController.text = DateFormat('dd-MM-yyyy').format(
        selectedDate,
      );
    }
  }

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

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout',),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomStepper(activeStep: activeStep),
                      RoundedContainer(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle(
                              text: 'Basic Information',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: firstNameController,
                              hintText: 'First Name',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: lastNameController,
                              hintText: 'Last Name',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: emailController,
                              hintText: 'Email',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: genderController,
                              hintText: 'Gender',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(Assets.icons.arrowDown),
                              ),
                              onTap: () {
                                // Gender selection logic
                              },
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomPhoneField(
                              controller: phoneController,
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: dateOfBirthController,
                              hintText: 'Date Of Birth',
                              suffixIcon:
                                  SvgPicture.asset(Assets.icons.calender),
                              onTap: () async {
                                await selectDate(context);
                              },
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CountryPickerField(
                              controller: countryController,
                              initialCountry: displayCountry,
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: fatherNameController,
                              hintText: "Father's Name",
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: motherNameController,
                              hintText: "Mother's Name",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              Center(
                child: SizedBox(
                  width: context.screenWidth * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeStep = 1;
                      });
                      context.router.push(CheckoutAddressRoute(
                          showShipmentAddress: widget.showShipmentAddress,),);
                    },
                    child: const Text('Save & Continue'),
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
