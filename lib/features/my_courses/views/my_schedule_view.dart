import 'package:auto_route/auto_route.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_schedule_view_model/my_schedule_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_schedule_view_model/my_schedule_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/my_schedule_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overlaymenu.dart';

@RoutePage()
class MyScheduleScreen extends ConsumerStatefulWidget {
  const MyScheduleScreen({required this.courseId, super.key});
  final String courseId;
  @override
  ConsumerState<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends ConsumerState<MyScheduleScreen> {
  EasyDatePickerController controller = EasyDatePickerController();

  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  String dateRangeToShow() {
    final leftText = DateFormat('MMMM d')
        .format(focusedDate.subtract(const Duration(days: 3)));
    final rightText =
        '${focusedDate.add(const Duration(days: 3)).day}, ${focusedDate.add(const Duration(days: 3)).year}';
    return '$leftText - $rightText';
  }

  @override
  Widget build(BuildContext context) {
    final scheduleState = ref.watch(myScheduleViewModelProvider);
    ref.listen(myScheduleViewModelProvider, (current, next) {
      if (next is MyScheduleSlotDeleted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Booking cancelled successfully',
              style: subtitle3.copyWith(
                color: Colors.white,
              ),
            ),
            backgroundColor: forestGreen,
          ),
        );
      } else if (next is MyScheduleFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.errorMessage,
              style: subtitle3.copyWith(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Schedule'),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
            child: Column(
              children: [
                weekController(),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                datePicker(context),
                if (scheduleState is MyScheduleSuccess)
                  scheduleState.mySlotsModel.slot == null
                      ? SizedBox(
                          width: context.screenWidth,
                          height: context.screenHeight * 0.3,
                          child: Center(
                            child: Text(
                              'You have no sessions in this date',
                              style: subtitle1.copyWith(color: Colors.black),
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: scheduleState.mySlotsModel.slot?.length ?? 0,
                          itemBuilder: (context, index) {
                            final slotData =
                                scheduleState.mySlotsModel.slot![index];
                            final facilitatorFirstName =
                                slotData.facilitatorDetails?.firstName ??
                                    'First Name';
                            final facilitatorlastName =
                                slotData.facilitatorDetails?.lastName ?? '';

                            return MyScheduleCard(
                              name: '$facilitatorFirstName $facilitatorlastName',
                              time:
                                  '${DateFormat('HH:mm').format(DateTime.parse(slotData.startDateTime!))} - ${DateFormat('HH:mm').format(
                                DateTime.parse(slotData.endDateTime!),
                              )}',
                              courseName: slotData.courseDetails?.title ?? 'title',
                              id: slotData.id!,
                              date: DateTime.parse(slotData.startDateTime!),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: context.screenHeight * 0.01,
                            );
                          },
                        )
                else
                  ShimmerCard(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.2,
                    borderRadius: 18,
                  ),
              ],
            ),
          ),
          if (_showOverlay)
            OverlayMenu(
              courseId: widget.courseId,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        onPressed: _toggleOverlay,
        child: _showOverlay
            ? SvgPicture.asset(Assets.icons.closeCircle)
            : SvgPicture.asset(Assets.icons.addCircle),
      ),
    );
  }

  EasyDateTimeLinePicker datePicker(BuildContext context) {
    return EasyDateTimeLinePicker.itemBuilder(
      controller: controller,
      itemExtent: context.screenWidth * 0.11,
      focusedDate: selectedDate,
      firstDate: DateTime(2024, 3, 18),
      lastDate: DateTime(2040, 3, 18),
      onDateChange: (date) {
        ref.read(myScheduleViewModelProvider.notifier).fetchMySlots(date: date);
        setState(() {
          selectedDate = date;
          focusedDate = date;
        });
      },
      itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
        return GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date.day.toString(),
                style: subtitle4.copyWith(
                  color: isSelected ? orange : silverChalice.shade600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  DateFormat('E').format(date),
                  style: heading4.copyWith(
                    color: isSelected ? orange : silverChalice.shade600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      headerOptions: const HeaderOptions(headerType: HeaderType.none),
    );
  }

  Row weekController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            controller.animateToDate(
              focusedDate.subtract(const Duration(days: 7)),
            );
            setState(() {
              focusedDate = focusedDate.subtract(const Duration(days: 7));
            });
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: orange,
            size: 20,
          ),
        ),
        Text(
          dateRangeToShow(),
          style: subtitle4.copyWith(
            color: silverChalice.shade900,
            fontSize: 15,
          ),
        ),
        IconButton(
          onPressed: () {
            controller.animateToDate(
              focusedDate.add(const Duration(days: 7)),
            );
            setState(() {
              focusedDate = focusedDate.add(const Duration(days: 7));
            });
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: orange,
            size: 20,
          ),
        ),
      ],
    );
  }
}
