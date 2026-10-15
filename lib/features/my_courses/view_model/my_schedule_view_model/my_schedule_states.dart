import 'package:skill_in_a_box_flutter/features/my_courses/model/my_slots_model/my_slots_model.dart';

abstract class MyScheduleStates {
  MyScheduleStates({this.slotsModel});
  final MySlotsModel? slotsModel;
}

class MyScheduleInitial implements MyScheduleStates {
  @override
  MySlotsModel? get slotsModel => null;
}

class MyScheduleLoading implements MyScheduleStates {
  MyScheduleLoading({this.mySlotsModel});
  final MySlotsModel? mySlotsModel;
  
  @override
  MySlotsModel? get slotsModel => mySlotsModel;
}

class MyScheduleSlotDeleted implements MyScheduleStates {
  MyScheduleSlotDeleted({this.mySlotsModel});
  final MySlotsModel? mySlotsModel;
  
  @override
  MySlotsModel? get slotsModel => mySlotsModel;
}

class MyScheduleSuccess implements MyScheduleStates {
  MyScheduleSuccess({required this.mySlotsModel});

  final MySlotsModel mySlotsModel;
  
  @override
  MySlotsModel? get slotsModel => mySlotsModel;
}

class MyScheduleFailed implements MyScheduleStates {
  MyScheduleFailed({required this.errorMessage, this.mySlotsModel});

  final String errorMessage;
  final MySlotsModel? mySlotsModel;
  
  @override
  MySlotsModel? get slotsModel => mySlotsModel;

}
