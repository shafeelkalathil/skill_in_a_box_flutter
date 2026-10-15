import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/my_course_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_schedule_view_model/my_schedule_states.dart';

final myScheduleViewModelProvider =
    StateNotifierProvider<MyScheduleViewModel, MyScheduleStates>(
  (ref) => MyScheduleViewModel(ref.watch(myCourseRepositoryProvider)),
);

class MyScheduleViewModel extends StateNotifier<MyScheduleStates> {
  MyScheduleViewModel(this.myCourseRepository) : super(MyScheduleInitial());

  final MyCourseRepository myCourseRepository;

  Future<void> fetchMySlots({
    required DateTime date,
  }) async {
    final searchDate = DateFormat('y-MM-dd').format(date);
    state = MyScheduleLoading();
    final response = await myCourseRepository.listMySlots(
      startDate: searchDate,
      endDate: searchDate,
    );
    response.fold((errorMessage) {
      state = MyScheduleFailed(errorMessage: errorMessage);
    }, (slotsModel) {
      state = MyScheduleSuccess(mySlotsModel: slotsModel);
    });
  }

  Future<void> cancelMySlot({
    required String slotId,
    required DateTime date,
  }) async {
    state = MyScheduleLoading(mySlotsModel: state.slotsModel);
    final response = await myCourseRepository.cancelSlot(slotId: slotId);
    response.fold((errorMessage) {
      state = MyScheduleFailed(
        errorMessage: errorMessage,
        mySlotsModel: state.slotsModel,
      );
      state = MyScheduleSuccess(mySlotsModel: state.slotsModel!);
    }, (isCancelled) {
      state = MyScheduleSlotDeleted(mySlotsModel: state.slotsModel);
      fetchMySlots(date: date);
    });
  }
}
