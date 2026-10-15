
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/kit/kit_model.dart';

abstract class KitState {}

class KitInitial extends KitState {}

class KitLoading extends KitState {}

class KitFailure extends KitState {
  KitFailure(this.message);
  final String message;
}

class KitSuccess extends KitState {
  KitSuccess(this.kitModel);
  final KitModel kitModel;
}
