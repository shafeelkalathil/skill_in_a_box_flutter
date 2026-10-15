import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/book_live_session_view_model/book_live_session_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/book_live_session_view_model/book_live_session_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/custom_date_picker.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/shimmer_card.dart';

@RoutePage()
class LiveSessionBookingScreen extends ConsumerStatefulWidget {
  const LiveSessionBookingScreen({required this.courseId, super.key});

  final String courseId;

  @override
  ConsumerState<LiveSessionBookingScreen> createState() =>
      _LiveSessionBookingScreenState();
}

class _LiveSessionBookingScreenState
    extends ConsumerState<LiveSessionBookingScreen> {
  DateTime _selectedDay = DateTime.now();

  String? selectedTime;
  final selectedTimeIndex = StateProvider<int?>((ref) => null);
  final selectedSlotId = StateProvider<String?>((ref) => null);
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.listen(bookLiveSessionViewModelProvider, (current, next) {
      if (current is BookLiveSessionRequested) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Request successfully submitted',
              style: subtitle3.copyWith(
                color: Colors.white,
              ),
            ),
            backgroundColor: forestGreen,
          ),
        );
      } else if (current is BookLiveSessionFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage,
              style: subtitle3.copyWith(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    final selectedTime = ref.watch(selectedTimeIndex);
    final bookingState = ref.watch(bookLiveSessionViewModelProvider);
    return Scaffold(
      backgroundColor: const Color(0xffF9FBFD),
      appBar: const CustomAppBar(
        title: 'Book Live session',
        backgroundColor: Color(0xffF9FBFD),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                calender(context),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Select Time',
                        style: subtitle3.copyWith(
                          color: silverChalice.shade900,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: subtitle3.copyWith(
                          color: orange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                slotSelection(context, bookingState, selectedTime),
                const SizedBox(
                  height: 50,
                ),
                bottomSection(bookingState, selectedTime),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Builder bottomSection(BookLiveSessionStates bookingState, int? selectedTime) {
    return Builder(
      builder: (context) {
        if (bookingState is BookLiveSessionSuccess) {
          return bookingState.bookLiveSessionModel.slot == null
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Topic of Discussion',
                      style: subtitle3.copyWith(
                        color: silverChalice.shade900,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Topic',
                        hintStyle: subtitle2.copyWith(
                          color: silverChalice.shade400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    requestButton(context, selectedTime),
                  ],
                );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Center requestButton(BuildContext context, int? selectedTime) {
    return Center(
      child: SizedBox(
        height: 44,
        width: context.screenWidth * 0.6,
        child: ElevatedButton(
          onPressed: () {
            selectedTime == null
                ? ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please select a time slot',
                        style: subtitle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: seagull,
                    ),
                  )
                : ref
                    .read(
                      bookLiveSessionViewModelProvider.notifier,
                    )
                    .bookSlot(
                      slotId: ref.watch(selectedSlotId)!,
                      topic: textEditingController.text,
                      courseId: widget.courseId,
                      date: _selectedDay,
                    );
          },
          child: const Text('Request for Session'),
        ),
      ),
    );
  }

  SizedBox slotSelection(
    BuildContext context,
    BookLiveSessionStates bookingState,
    int? selectedTime,
  ) {
    return SizedBox(
      height: context.screenHeight * 0.05,
      child: bookingState is BookLiveSessionSuccess
          ? bookingState.bookLiveSessionModel.slot == null
              ? Text(
                  'No slots Available',
                  style: subtitle2.copyWith(
                    color: silverChalice.shade400,
                  ),
                )
              : slotBuilder(bookingState, selectedTime)
          : ShimmerCard(
              width: context.screenWidth,
              height: context.screenHeight * 0.05,
              borderRadius: 8,
            ),
    );
  }

  ListView slotBuilder(BookLiveSessionSuccess bookingState, int? selectedTime) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bookingState.bookLiveSessionModel.slot?.length ?? 0,
      itemBuilder: (context, index) {
        final slot = bookingState.bookLiveSessionModel.slot![index];
        final startTime = DateFormat('hh:mm a').format(
          DateTime.parse(slot.startDateTime!),
        );
        final endTime = DateFormat('hh:mm a').format(
          DateTime.parse(slot.startDateTime!),
        );

        return GestureDetector(
          onTap: () {
            if (slot.isRequested!) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'This Slot is already requested by you',
                    style: subtitle3.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              ref.read(selectedSlotId.notifier).update((value) => slot.id);
              ref.read(selectedTimeIndex.notifier).update((value) => index);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              right: context.screenWidth * 0.03,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: selectedTime == index ? orange.shade100 : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: selectedTime == index
                    ? orange.shade500
                    : slot.isRequested!
                        ? seagull
                        : silverChalice.shade200,
              ),
            ),
            child: Center(
              child: Text(
                '$startTime - $endTime',
                style: subtitle2.copyWith(
                  color: selectedTime == index
                      ? orange.shade500
                      : silverChalice.shade400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container calender(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.only(
        left: context.screenWidth * 0.02,
        right: context.screenWidth * 0.02,
        bottom: context.screenWidth * 0.02,
      ),
      child: CustomDatePicker(
        focusedDay: _selectedDay,
        onDaySelected: (selectedDay, focusedDay) {
          ref.read(selectedTimeIndex.notifier).update((value) => null);
          ref.read(bookLiveSessionViewModelProvider.notifier).listAllSlots(
                courseId: widget.courseId,
                date: selectedDay,
              );
          setState(() {
            _selectedDay = selectedDay;
          });
        },
        selectedDay: _selectedDay,
      ),
    );
  }
}
