import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/model/leader_board_model/leader_board_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/repositories/leader_board_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/leader_board/leader_board_state.dart';

final leaderBoardViewModelNotifier =
StateNotifierProvider<LeaderBoardViewModel, LeaderBoardState>(
      (ref) => LeaderBoardViewModel(ref.read(leaderBoardRepositoryProvider)),
);

final getLeaderBoardDetailsProvider =
FutureProvider.family<LeaderBoardModel, String>((ref, courseId) async {
  final leaderBoardRepository = ref.watch(leaderBoardRepositoryProvider);

  final result =
  await leaderBoardRepository.getLeaderBoardDetails(courseId: courseId);

  return result.fold(
        (error) => throw Exception(error),
        (data) => data,
  );
});

class LeaderBoardViewModel extends StateNotifier<LeaderBoardState> {
  LeaderBoardViewModel(this.leaderBoardRepository)
      : super(LeaderBoardInitial());

  final LeaderBoardRepository leaderBoardRepository;

  Future<void> getLeaderBoardDetails({required String courseId}) async {
    state = LeaderBoardLoading();

    final result = await leaderBoardRepository
        .getLeaderBoardDetails(courseId: courseId);

    result.fold(
          (errorMessage) {
        state = LeaderBoardFailure(errorMessage);
      },
          (leaderBoardModel) {
        state = LeaderBoardSuccess(leaderBoardModel);
      },
    );
  }

}
