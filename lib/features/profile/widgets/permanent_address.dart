import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/models/address_model/address_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/address_view_model/address_states.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/address_view_model/address_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/build_info_section.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class PermanentAddress extends ConsumerStatefulWidget {
  const PermanentAddress({super.key});

  @override
  ConsumerState createState() => _PermanentAddressState();
}

class _PermanentAddressState extends ConsumerState<PermanentAddress> {
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final isEdit = ref.watch(isPermanentAddressEditCheck);
    final state = ref.watch(addressViewModelNotifier);
    final permanentAddressState = state.addressModel?.permanentAddress;
    addressController.text = permanentAddressState?.address ?? '_';
    cityController.text = permanentAddressState?.city ?? '_';
    stateController.text = permanentAddressState?.state ?? '_';
    pinCodeController.text = permanentAddressState?.pinCode ?? '_';
    countryController.text = permanentAddressState?.country ?? '_';
    if (state is AddressLoading && state.addressModel == null) {
      return ShimmerCard(
        width: context.screenWidth,
        height: context.screenHeight * 0.6,
        borderRadius: 16,);
    } else {
      return RoundedContainer(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Permanent Address',
                  style: heading3.copyWith(color: dark
                      ? Colors.white :silverChalice.shade800,),
                ),
                if (!isEdit)
                  InkWell(
                    onTap: () {
                      ref.read(isPermanentAddressEditCheck.notifier).state =
                          true;
                    },
                    child: Container(
                      width: context.screenWidth *
                          0.12, // Adjust size based on width
                      height: context.screenWidth * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: dark
                            ? orange.shade500:const Color(0xffE7E7E7),),
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.edit,
                          color: dark ? orange.shade500:null,),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            BuildInfoSection(
              title: 'Address',
              hintText: 'Address',
              isEdit: isEdit,
              controller: addressController,
            ),
            BuildInfoSection(
              title: 'City / Town',
              hintText: 'City / Town',
              isEdit: isEdit,
              controller: cityController,
            ),
            BuildInfoSection(
              title: 'State / Province',
              hintText: 'State / Province',
              isEdit: isEdit,
              controller: stateController,
            ),
            BuildInfoSection(
              title: 'PIN Code',
              hintText: 'PIN Code',
              isEdit: isEdit,
              controller: pinCodeController,
            ),
            BuildInfoSection(
              title: 'Country',
              hintText: 'Country',
              isEdit: isEdit,
              controller: countryController,
              isCountryDropDown: true,
            ),
            if (isEdit)
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
            if (isEdit)
              Center(
                child: SizedBox(
                  width: context.screenWidth * 0.43,
                  child: ElevatedButton(
                    onPressed: () {
                      final updatedAddressModel = state.addressModel?.copyWith(
                        permanentAddress: Address(
                          id: permanentAddressState?.id,
                          address: addressController.text,
                          country: countryController.text,
                          state: stateController.text,
                          pinCode: pinCodeController.text,
                          city: cityController.text,
                        ),
                      );
                      ref
                          .read(addressViewModelNotifier.notifier)
                          .updateAddressDetails(updatedAddressModel, ref);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }
}
