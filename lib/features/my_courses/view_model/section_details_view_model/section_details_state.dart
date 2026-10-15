import 'package:skill_in_a_box_flutter/features/my_courses/model/section_model/section_ui_model/section_ui_model.dart';

abstract class SectionDetailsStates {}

class SectionDetailsInitial implements SectionDetailsStates {}

class SectionDetailsLoading implements SectionDetailsStates {}

class SectionDetailsSuccess implements SectionDetailsStates {
  SectionDetailsSuccess({
    required this.sectionUiModel,
    required this.currentLesson,
  });
  final String currentLesson;
  final List<SectionUiModel> sectionUiModel;
}

class SectionDetailsFailed implements SectionDetailsStates {
  SectionDetailsFailed({required this.errorMessage});

  final String errorMessage;
}
