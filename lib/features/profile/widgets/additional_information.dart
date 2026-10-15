import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/build_info_section.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/circular_progress_indicator.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class AdditionalInformation extends ConsumerStatefulWidget {
  const AdditionalInformation({
    super.key,
  });

  @override
  ConsumerState<AdditionalInformation> createState() =>
      _AdditionalInformationState();
}

class _AdditionalInformationState extends ConsumerState<AdditionalInformation> {
  TextEditingController countryController =
      TextEditingController(text: 'India');
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      dateOfBirthController.text =
          DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(basicDetailsViewModelProvider);
    final userDetails = state.userDetails;
    countryController.text = userDetails?.student?.country ?? '';
    dateOfBirthController.text = userDetails?.student?.dateOfBirth ?? '';
    fatherNameController.text = userDetails?.student?.fatherName ?? '';
    motherNameController.text = userDetails?.student?.motherName ?? '';

    final isEdit = ref.watch(isAdditionalInformationEditCheck);
    final dark = AppHelpers.isDarkMode(context);
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Additional Information',
                style: heading2.copyWith(
                  color: dark ? Colors.white : silverChalice.shade800,
                ),
              ),
              if (!isEdit)
                InkWell(
                  onTap: () {
                    ref.read(isAdditionalInformationEditCheck.notifier).state =
                        true;
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
          SizedBox(height: context.screenHeight * 0.03),
          BuildInfoSection(
            title: 'Country of Residence',
            hintText: 'Country of Residence',
            isEdit: isEdit,
            controller: countryController,
            isReadOnly: true,
          ),
          BuildInfoSection(
            title: 'Date of Birth',
            hintText: 'Date of Birth',
            isEdit: isEdit,
            controller: dateOfBirthController,
            suffixIcon: SvgPicture.asset(Assets.icons.calendar),
            suffixOnTap: () async {
              await selectDate(context);
            },
          ),
          BuildInfoSection(
            title: 'Father’s Name',
            hintText: 'Father’s Name',
            isEdit: isEdit,
            controller: fatherNameController,
          ),
          BuildInfoSection(
            title: 'Mother’s Name',
            hintText: 'Mother’s Name',
            isEdit: isEdit,
            controller: motherNameController,
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
                      child: ElevatedButton(
                        onPressed: () {
                          onPressed(state);
                        },
                        child: const Text('Save'),
                      ),
                    ),
            ),
        ],
      ),
    );
  }

  void onPressed(BasicDetailsState state) {
    final student = state.userDetails!.student!.copyWith(
      country: countryController.text,
      dateOfBirth: dateOfBirthController.text,
      fatherName: fatherNameController.text,
      motherName: motherNameController.text,
    );
    ref
        .read(basicDetailsViewModelProvider.notifier)
        .updateUserBasicDetails(student, ref);
  }
}
