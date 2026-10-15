import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/kit_view_model/kit_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/kit_view_model/kit_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/kit_information_stepper.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';

@RoutePage()
class KitInformationScreen extends ConsumerStatefulWidget {
  const KitInformationScreen({required this.courseId, super.key});
  final String courseId;

  @override
  ConsumerState<KitInformationScreen> createState() =>
      _KitInformationScreenState();
}

class _KitInformationScreenState extends ConsumerState<KitInformationScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(kitViewModelNotifier.notifier)
          .getKitDetails(courseId: widget.courseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final kitState = ref.watch(kitViewModelNotifier);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Kit Information'),
      body: kitState is KitLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          :kitState is KitFailure
          ? Center(child: Text(kitState.message),)
          :kitState is KitSuccess
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kit Shipment Status',style: defaultButton.copyWith(
                  color: dark ? Colors.white : silverChalice.shade900,),),
                KitInformationStepper(
                    activeStep: kitState.kitModel.kit.status == 'processing'
                        ?0
                        :kitState.kitModel.kit.status == 'transit'
                        ?1
                        :kitState.kitModel.kit.status == 'delivered'
                        ?2
                        :0,
                ),
                const SizedBox(height: 20),

                RoundedContainer(
                  isPadding: false,
                  widget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: dark
                          ? Colors.transparent:Colors.grey.shade400,),
                    ),
                    child: Table(
                      columnWidths: const {
                        1: FlexColumnWidth(3),
                      },
                      border: TableBorder(
                        horizontalInside: BorderSide(
                          color: dark ? Colors.black:Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: orange.shade500,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('#',
                                style:  heading4.copyWith(
                                  color: Colors.white,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Kit Items',
                                style:  heading4.copyWith(
                                  color: Colors.white,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Quantity',
                                style:  heading4.copyWith(
                                  color: Colors.white,),),
                            ),
                          ],
                        ),

                        ...List.generate(kitState.kitModel.kit.items.length,
                                (index) {
                          final kitItem = kitState.kitModel.kit.items[index];
                          return TableRow(
                            decoration: BoxDecoration(
                              color: dark ? const Color(0xff1C1C1E):index.isOdd
                                  ? orange.shade50
                                  : Colors.white,
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  (index + 1).toString(),
                                  style: heading4.copyWith(
                                    color: dark
                                        ? Colors.white:silverChalice.shade700,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  kitItem.name,
                                  style: heading4.copyWith(
                                    color: dark
                                        ? Colors.white
                                        :silverChalice.shade700,),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  kitItem.quantity.toString(),
                                  style: heading4.copyWith(
                                    color: dark
                                        ? Colors.white
                                        :silverChalice.shade700,),),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          :const SizedBox.shrink(),
    );
  }
}
