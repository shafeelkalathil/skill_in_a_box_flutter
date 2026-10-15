
import 'package:skill_in_a_box_flutter/features/my_courses/model/leader_board_model/leader_board_model.dart';

abstract class LeaderBoardState {}

class LeaderBoardInitial extends LeaderBoardState {}

class LeaderBoardLoading extends LeaderBoardState {}

class LeaderBoardFailure extends LeaderBoardState {
  LeaderBoardFailure(this.message);
  final String message;
}

class LeaderBoardSuccess extends LeaderBoardState {
  LeaderBoardSuccess(this.leaderBoardModel);
  final LeaderBoardModel leaderBoardModel;
}
