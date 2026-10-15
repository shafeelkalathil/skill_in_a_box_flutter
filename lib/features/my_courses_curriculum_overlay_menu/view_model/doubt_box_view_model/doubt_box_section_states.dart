import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/doubt_box/section_details_model/doubt_box_section_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_states.dart';

class DoubtBoxSectionInitial implements DoubtBoxStates {}

class DoubtBoxSectionLoading implements DoubtBoxStates {}


class DoubtBoxSectionSuccess implements DoubtBoxStates {
  DoubtBoxSectionSuccess({required this.doubtBoxSectionDetailsModel});

  final DoubtBoxSectionDetailsModel doubtBoxSectionDetailsModel;
}

class DoubtBoxSectionFailed implements DoubtBoxStates {
  DoubtBoxSectionFailed({required this.errorMessage});

  final String errorMessage;
}
