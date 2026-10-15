import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/address_view_model/address_states.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/address_view_model/address_view_model.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/permanent_address.dart';
import 'package:skill_in_a_box_flutter/features/profile/widgets/shipment_address.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/custom_snack_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

@RoutePage()
class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(addressViewModelNotifier, (previous, current) {
      if (current is AddressFailed && current.addressModel != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar.show(errorMessage: current.errorMessage),
        );
      }
    });
    final state = ref.watch(addressViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Address',
      ),
      body: SafeArea(
        child: (state is AddressFailed && state.addressModel == null)
            ? CustomErrorWidget(
                errorMessage: state.errorMessage,
                onPressed: () {
                  ref
                      .read(addressViewModelNotifier.notifier)
                      .fetchAddressDetails();
                },
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.06,
                    vertical: context.screenHeight * 0.01,
                  ),
                  child: Column(
                    children: [
                      const PermanentAddress(),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      const ShipmentAddress(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
