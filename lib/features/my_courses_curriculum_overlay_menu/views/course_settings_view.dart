import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/formatters/date_formatter.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/course_extend_validity/course_extend_data_model/course_extend_data_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/course_settings_view_model/course_settings_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/course_settings_view_model/course_settings_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/custom_transparent_button.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';

@RoutePage()
class CourseSettingsScreen extends ConsumerStatefulWidget {
  const CourseSettingsScreen({required this.courseId,super.key});
  final String courseId;

  @override
  CourseSettingsScreenState createState() => CourseSettingsScreenState();
}

class CourseSettingsScreenState extends ConsumerState<CourseSettingsScreen> {
  String selectedDuration = 'oneMonthExtensionFee';
  String extendPeriod = 'oneMonthExtensionFee';
  double extendFee = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(courseSettingsViewModelNotifier.notifier)
          .getExtendValidity(courseId: widget.courseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final state = ref.watch(courseSettingsViewModelNotifier);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Course Setting'),
      body: state is CourseExtendDataLoading
          ? const Center(child: CircularProgressIndicator(),)
          : state is CourseExtendDataFailure
          ? Center(child: Text(state.message),)
          : state is CourseExtendDataSuccess 
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.06,),
          child: Column(
            children: [
              RoundedContainer(
                widget: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Course Validity', style: heading4
                                  .copyWith(
                                color: dark
                                    ? Colors.white : silverChalice.shade500,),),
                              Text(
                                DateFormatter.getFormattedDate(
                                    state.courseExtendDataModel.courseValidity,
                                    format: 'dd MMM yyyy',),
                                style: subtitle4.copyWith(
                                  fontSize: context.screenWidth * 0.04,
                                  color: dark
                                      ? Colors.white : silverChalice.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: context.screenWidth * 0.08),
                        SizedBox(
                          height: context.screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: () {
                              showCurvedBottomSheet(context,dark: dark,
                                data: state.courseExtendDataModel,);
                            },
                            child: const Text('Extend Validity'),
                          ),
                        ),
                      ],
                    ),
                    if(state.courseExtendDataModel
                        .courseCancellationFee != null)const SizedBox(height: 30,),
                    if(state.courseExtendDataModel
                        .courseCancellationFee != null)Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cancellation Fee', style: heading4
                                  .copyWith(
                                color: dark
                                    ? Colors.white : silverChalice.shade500,),),
                              Text(
                                (state.courseExtendDataModel
                                    .courseCancellationFee ?? '0').toString(),
                                style: subtitle4.copyWith(
                                  fontSize: context.screenWidth * 0.04,
                                  color: dark
                                      ? Colors.white : silverChalice.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: context.screenWidth * 0.08),
                        SizedBox(
                          height: context.screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF44336),
                            ),
                            child: const Text('Pay Cancellation Fee'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              RoundedContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Language', style: heading4.copyWith(
                      color: silverChalice.shade500,),),
                    SizedBox(height: context.screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: CustomTransparentButton(
                            text: 'English',
                            selected: true,
                          ),
                        ),
                        SizedBox(width: context.screenWidth * 0.04),
                        const Expanded(
                          child: CustomTransparentButton(
                            text: 'Hindi',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
          : const SizedBox.shrink(),
    );
  }

  void showCurvedBottomSheet(BuildContext context,
      {required bool dark,required CourseExtendDataModel data,}) {

    final extendFeesMap = {
      'oneMonthExtensionFee': data.extendFees.oneMonthExtensionFee,
      'threeMonthExtensionFee': data.extendFees.threeMonthExtensionFee,
      'sixMonthExtensionFee': data.extendFees.sixMonthExtensionFee,
      'oneYearExtensionFee': data.extendFees.oneYearExtensionFee,
    };


    showModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: dark
          ? const Color(0xff2C2C2E) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.05,
                vertical: context.screenHeight * 0.02,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: context.screenWidth * 0.15,
                      height: context.screenHeight * 0.005,
                      decoration: BoxDecoration(
                        color: dark
                            ? const Color(0xff222223):Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Course Validity Extension',
                          style: heading1.copyWith(
                            color: dark
                                ? Colors.white : silverChalice.shade900,),),
                      ),
                      IconButton(
                        icon: Icon(Icons.close,
                            color: dark ? Colors.white
                                : silverChalice.shade600,),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text('Select Period',style: subtitle3.copyWith(
                      color: dark ? Colors.white :silverChalice.shade900,),),
                  SizedBox(height: context.screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: extendFeesMap.entries.map((entry) {
                      var optionKey = entry.key;
                      final fee = entry.value;
                      optionKey = optionKey == 'oneMonthExtensionFee'
                          ? '1 Month'
                          : optionKey == 'threeMonthExtensionFee'
                          ? '3 Month'
                          : optionKey == 'sixMonthExtensionFee'
                          ? '6 Month'
                          : optionKey == 'oneYearExtensionFee'
                          ? '1 Year' : '';
                      final isSelected = selectedDuration == optionKey;
                      return GestureDetector(
                        onTap: () {
                          setModalState(() {
                            selectedDuration = optionKey;
                            extendFee = fee.toDouble() ;
                          });
                        },
                        child: Container(
                          height: context.screenHeight * 0.06,
                          width: context.screenWidth * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? orange.shade500
                                  : dark
                                  ? Colors.transparent
                                  : silverChalice.shade400,
                            ),
                            color: isSelected
                                ? (dark
                                ? const Color(0xff222223)
                                : orange.shade200)
                                : (dark ? const Color(0xff222223) : null),
                          ),
                          child: Center(
                            child: Text(
                              optionKey.replaceAll('ExtensionFee', ''),
                              style: subtitle1.copyWith(
                                color: isSelected
                                    ? orange.shade500
                                    : silverChalice.shade400,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
                  Text('Fee', style: subtitle3.copyWith(
                      color: dark ? Colors.white :silverChalice.shade900,),),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text('₹ $extendFee', style: heading1.copyWith(
                      color: orange.shade500, fontWeight: FontWeight.w600,),),
                  SizedBox(height: context.screenHeight * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTransparentButton(
                            text: 'Cancel',
                          onTap: () => context.router.popForced(),
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.04),
                      Expanded(
                        child: SizedBox(
                          height: context.screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: () {
                              ref.read(courseSettingsViewModelNotifier.notifier)
                                  .courseExtendValidity(
                                  courseId: widget.courseId,
                                  extendPeriod: extendPeriod,).then((value) {
                                  final extendState =
                                  ref.watch(courseSettingsViewModelNotifier);
                                  if(extendState is CourseSettingsSuccess){
                                    ref.read(courseSettingsViewModelNotifier.notifier)
                                        .getExtendValidity(courseId: widget.courseId);
                                    final courseSettingState =
                                    ref.watch(courseSettingsViewModelNotifier);
                                    if(courseSettingState is CourseSettingsSuccess){
                                      context.router.popForced();
                                    }
                                  }
                                  },);
                            },
                            child: const Text('Pay Extension Fee'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
