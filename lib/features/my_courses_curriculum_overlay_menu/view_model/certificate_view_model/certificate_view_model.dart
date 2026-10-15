import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/certificate_repositories.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/certificate_view_model/certificate_state.dart';

final certificateViewModelNotifier =
StateNotifierProvider<CertificateViewModel, CertificateState>(
      (ref) => CertificateViewModel(ref.read(certificateRepositoryProvider)),
);


class CertificateViewModel extends StateNotifier<CertificateState> {
  CertificateViewModel(this.certificateRepository)
      : super(CertificateInitial());

  final CertificateRepository certificateRepository;

  Future<void> getCertificateDetails({required String courseId}) async {
    state = CertificateLoading();
    final result = await certificateRepository
        .getCertificateDetails(courseId: courseId);
    result.fold((errorMessage) {
      state = CertificateFailure(errorMessage,);
    },(certificateModel) {
      state = CertificateSuccess(certificateModel);
    },
    );
  }

}
