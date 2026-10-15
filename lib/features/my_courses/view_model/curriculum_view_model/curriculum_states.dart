import 'package:skill_in_a_box_flutter/features/my_courses/model/curriculum_model/curriculum_model.dart';

abstract class CurriculumStates {
  CurriculumStates({this.stateCurriculumModel});
  final CurriculumModel? stateCurriculumModel;
}

class CurriculumInitial implements CurriculumStates {
  @override
  CurriculumModel? get stateCurriculumModel => null;
}

class CurriculumLoading implements CurriculumStates {
  CurriculumLoading({this.curriculumModel});

  final CurriculumModel ? curriculumModel;
  @override
  CurriculumModel? get stateCurriculumModel => curriculumModel;
}

class CurriculumSuccess implements CurriculumStates {
  CurriculumSuccess({required this.curriculumModel});

  final CurriculumModel curriculumModel;
  
  @override
  CurriculumModel? get stateCurriculumModel => curriculumModel;
}

class CurriculumFailed implements CurriculumStates {
  CurriculumFailed({required this.errorMessage, this.curriculumModel});

  final String errorMessage;
  final CurriculumModel ? curriculumModel;
  @override
  CurriculumModel? get stateCurriculumModel => curriculumModel;
}
