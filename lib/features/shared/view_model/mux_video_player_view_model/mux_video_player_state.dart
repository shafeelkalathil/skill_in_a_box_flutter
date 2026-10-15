import 'package:skill_in_a_box_flutter/features/shared/model/mux_asset_by_id_model/mux_asset_by_id_model.dart';

abstract class MuxVideoPlayerStates {}

class MuxVideoPlayerInitial implements MuxVideoPlayerStates {}

class MuxVideoPlayerLoading extends MuxVideoPlayerStates {}

class MuxVideoPlayerFailure extends MuxVideoPlayerStates {
  MuxVideoPlayerFailure(this.message);
  final String message;
}

class MuxVideoPlayerSuccess extends MuxVideoPlayerStates {
  MuxVideoPlayerSuccess(this.finalExamStatusModel);
  final MuxAssetByIdModel finalExamStatusModel;
}




