import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/shared/repositories/mux_video_player_repositories.dart';
import 'package:skill_in_a_box_flutter/features/shared/view_model/mux_video_player_view_model/mux_video_player_state.dart';

final muxVideoPlayerViewModelNotifier =
StateNotifierProvider<MuxVideoPlayerViewModel, MuxVideoPlayerStates>(
      (ref) => MuxVideoPlayerViewModel(ref.read(muxVideoPlayerRepositoriesProvider)),
);


class MuxVideoPlayerViewModel extends StateNotifier<MuxVideoPlayerStates> {
  MuxVideoPlayerViewModel(this.muxVideoPlayerRepositories)
      : super(MuxVideoPlayerInitial());

  final MuxVideoPlayerRepositories muxVideoPlayerRepositories;

  Future<void> fetchMuxAssetById({
    required String assetId,}) async {

    state = MuxVideoPlayerLoading();
    final result = await muxVideoPlayerRepositories
        .fetchMuxAssetById(assetId: assetId);

    result.fold((errorMessage) {
      state = MuxVideoPlayerFailure(errorMessage);
    }, (finalExamStatusModel) {
      state = MuxVideoPlayerSuccess(finalExamStatusModel);
    },
    );
  }


}
