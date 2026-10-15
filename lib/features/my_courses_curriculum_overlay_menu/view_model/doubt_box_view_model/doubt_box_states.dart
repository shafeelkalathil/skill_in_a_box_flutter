
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/doubt_box/section_model/doubt_box_section_model.dart';

abstract class DoubtBoxStates {}

class DoubtBoxInitial implements DoubtBoxStates {}

class DoubtBoxLoading implements DoubtBoxStates {}


class DoubtBoxSuccess implements DoubtBoxStates {
  DoubtBoxSuccess({required this.doubtBoxSectionModel});

  final DoubtBoxSectionModel doubtBoxSectionModel;
}

class DoubtBoxFailed implements DoubtBoxStates {
  DoubtBoxFailed({required this.errorMessage});

  final String errorMessage;
}
