import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/phone_number_view_model/phone_number_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/build_info_section.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/circular_progress_indicator.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class BasicInformation extends ConsumerStatefulWidget {
  const BasicInformation({
    super.key,
  });

  @override
  ConsumerState<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends ConsumerState<BasicInformation> {
  TextEditingController studentIdController = TextEditingController();
  TextEditingController digitalIdController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(basicDetailsViewModelProvider);
    // final phoneNumber = ref.watch(phoneNumberProvider);
    final userDetails = state.userDetails;
    studentIdController.text = userDetails?.student?.studentId ?? '_';
    digitalIdController.text = '_';
    firstNameController.text = userDetails?.student?.firstName ?? '_';
    lastNameController.text = userDetails?.student?.lastName ?? '_';
    emailController.text = userDetails?.student?.email ?? '_';
    phoneController.text = userDetails?.student?.phoneNumber ?? '_';
    final isEdit = ref.watch(isBasicInformationEditCheck);
    final dark = AppHelpers.isDarkMode(context);
    return RoundedContainer(
      darkModeBorderColor: Colors.transparent,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Basic Information',
                style: heading3.copyWith(
                  color: dark ? Colors.white : silverChalice.shade800,
                ),
              ),
              if (!isEdit)
                InkWell(
                  onTap: () {
                    ref.read(isBasicInformationEditCheck.notifier).state = true;
                  },
                  child: Container(
                    width: context.screenWidth *
                        0.12, // Adjust size based on width
                    height: context.screenWidth * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: dark ? orange.shade500 : const Color(0xffE7E7E7),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.icons.edit,
                        color: dark ? orange.shade500 : null,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
          BuildInfoSection(
            title: 'Student ID',
            hintText: 'Student ID',
            isEdit: isEdit,
            controller: studentIdController,
            isReadOnly: true,
          ),
          BuildInfoSection(
            title: 'Skill India Digital ID',
            hintText: 'Skill India Digital ID',
            isEdit: isEdit,
            controller: digitalIdController,
            isReadOnly: true,
          ),
          BuildInfoSection(
            title: 'First Name',
            hintText: 'First Name',
            isEdit: isEdit,
            controller: firstNameController,
          ),
          BuildInfoSection(
            title: 'Last Name',
            hintText: 'Last Name',
            isEdit: isEdit,
            controller: lastNameController,
          ),
          BuildInfoSection(
            title: 'Email',
            hintText: 'Email',
            isReadOnly: true,
            isEdit: isEdit,
            controller: emailController,
          ),
          BuildInfoSection(
            title: 'Phone Number',
            hintText: 'Phone Number',
            isReadOnly: true,
            isEdit: isEdit,
            controller: phoneController,
          ),
          if (isEdit)
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
          if (isEdit)
            Center(
              child: state is BasicDetailsLoading
                  ? const CustomCircularProgressIndicator()
                  : SizedBox(
                      width: context.screenWidth * 0.43,
                      child: Consumer(
                        builder: (context, ref, child) {
                          final phoneNumber = ref.watch(phoneNumberProvider);
                          return ElevatedButton(
                            onPressed: () {
                              onPressed(phoneNumber, state);
                            },
                            child: const Text('Save'),
                          );
                        },
                      ),
                    ),
            ),
        ],
      ),
    );
  }

  void onPressed(PhoneNumber? phoneNumber, BasicDetailsState state) {
    //used to manage new Phonenumber

    // var editedPhoneNumber = detailsModel.PhoneNumber();
    // if (phoneNumber != null) {
    //   final phoneNumberLength = phoneNumber.number.length;
    //   editedPhoneNumber = detailsModel.PhoneNumber(
    //     countryCode: int.parse(phoneNumber.countryCode),
    //     isoCode: phoneNumber.countryISOCode,
    //     areaCode:
    //         phoneNumberLength == 10 ? phoneNumber.number.substring(0, 4) : '',
    //     phoneNumber: phoneNumberLength == 10
    //         ? phoneNumber.number.substring(4)
    //         : phoneNumber.number,
    //   );
    // }
    final student = state.userDetails!.student!.copyWith(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      studentId: studentIdController.text,
    );
    ref
        .read(basicDetailsViewModelProvider.notifier)
        .updateUserBasicDetails(student, ref);
  }
}
