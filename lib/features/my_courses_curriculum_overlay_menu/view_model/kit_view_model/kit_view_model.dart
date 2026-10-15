import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/kit_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/kit_view_model/kit_state.dart';

final kitViewModelNotifier =
StateNotifierProvider<KitViewModel, KitState>(
      (ref) => KitViewModel(ref.read(kitRepositoryProvider)),
);


class KitViewModel extends StateNotifier<KitState> {
  KitViewModel(this.kitRepository) : super(KitInitial());

  final KitRepository kitRepository;

  Future<void> getKitDetails({required String courseId}) async {
     state = KitLoading();
     final result = await kitRepository.getKitDetails(courseId: courseId);
     result.fold((errorMessage) {
         state = KitFailure(errorMessage,);
       },(kitModel) {
         state = KitSuccess(kitModel);
       },
     );
  }

}
