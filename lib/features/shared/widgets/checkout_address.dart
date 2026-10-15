import 'package:auto_route/annotations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/custom_stepper.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/sections.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/checkout_payment.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/status_badge.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';

@RoutePage()
class CheckoutAddressScreen extends ConsumerStatefulWidget {
  const CheckoutAddressScreen({super.key, this.showShipmentAddress = false});

  final bool showShipmentAddress;

  @override
  ConsumerState createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends ConsumerState<CheckoutAddressScreen> {
  int activeStep = 1;
  bool checkShipmentAddress = false;

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  TextEditingController shipmentAddressController = TextEditingController();
  TextEditingController shipmentCityController = TextEditingController();
  TextEditingController shipmentStateController = TextEditingController();
  TextEditingController shipmentPinCodeController = TextEditingController();
  TextEditingController shipmentCountryController = TextEditingController();

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
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
                            const SectionTitle(text: 'Address'),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: addressController,
                              hintText: 'Permanent Address',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: cityController,
                              hintText: 'City / Town',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: stateController,
                              hintText: 'State / Province',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CustomTextField(
                              controller: pinCodeController,
                              hintText: 'PIN Code',
                            ),
                            SizedBox(height: context.screenHeight * 0.015),
                            CountryPickerField(
                              controller: countryController,
                              initialCountry: displayCountry,
                            ),
                          ],
                        ),
                      ),
                      if (widget.showShipmentAddress)
                        const SizedBox(
                          height: 20,
                        ),
                      if (widget.showShipmentAddress)
                        RoundedContainer(
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionTitle(text: 'Shipment Address'),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkShipmentAddress,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        checkShipmentAddress =
                                            !checkShipmentAddress;
                                      });
                                    },
                                    checkColor: orange.shade500,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: silverChalice.shade500,
                                      ),
                                    ),
                                    side: BorderSide(
                                      color: silverChalice.shade500,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  Text(
                                    'Same as Permanent Address',
                                    style: subtitle2.copyWith(
                                        color: silverChalice.shade500,),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                controller: shipmentAddressController,
                                hintText: 'Shipment Address',
                              ),
                              CustomTextField(
                                controller: shipmentCityController,
                                hintText: 'City / Town',
                              ),
                              CustomTextField(
                                controller: shipmentStateController,
                                hintText: 'State / Province',
                              ),
                              CustomTextField(
                                controller: shipmentPinCodeController,
                                hintText: 'PIN Code',
                              ),
                              CountryPickerField(
                                controller: shipmentCountryController,
                                initialCountry: displayCountry,
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * 0.03),
                child: Center(
                  child: SizedBox(
                    width: context.screenWidth * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          activeStep = 2;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPaymentScreen(
                              child: PaymentDetails(dark: dark),
                            ),
                          ),
                        );
                      },
                      child: const Text('Save & Continue'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
    required this.dark, super.key,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            text: 'Payment Details',
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedContainer(
            isPadding: false,
            borderColor: orange.shade500,
            widget: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        'Event Fee',
                        style: heading3.copyWith(
                          fontWeight: FontWeight.w600,
                          color: dark
                           ? const Color(0xffD3D3D3,)
                           : silverChalice.shade900,
                        ),
                      ),
                      StatusBadge(
                        value: 'Unpaid',
                        color: orange.shade500,
                        bgColor: orange.shade200,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        'Amount',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color:dark
                            ? const Color(0xffD3D3D3,)
                            : silverChalice.shade500,
                        ),
                      ),
                      Text(
                        '₹ 5,000.00',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color:dark
                            ? const Color(0xffD3D3D3,)
                            : silverChalice.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color:dark
                            ? const Color(0xffD3D3D3,)
                            : silverChalice.shade500,
                        ),
                      ),
                      Text(
                        '₹ 0.00',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color:dark
                            ? const Color(0xffD3D3D3,)
                            : silverChalice.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        'Amount After Discount',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color:dark
                            ? const Color(0xffD3D3D3,)
                            : silverChalice.shade500,
                        ),
                      ),
                      Text(
                        '₹ 5,000.00',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color:dark
                            ? const Color(0xffD3D3D3,)
                            : silverChalice.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
