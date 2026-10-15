import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/certificate_view_model/cerificate_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/repositories/certificate_repositories.dart';

final selfLearningCertificateViewModelProvider = StateNotifierProvider.family<
    SelfLearningCertificateViewModel, CertificateState, String>(
  (ref, courseId) => SelfLearningCertificateViewModel(
    ref.watch(certificateRepositoryProvider),
  ),
);

class SelfLearningCertificateViewModel extends StateNotifier<CertificateState> {
  SelfLearningCertificateViewModel(this.certificateRepository)
      : super(CertificateInitial());

  final CertificateRepository certificateRepository;

  Future<void> getCertificate({
    required String courseId,
    bool isRefreshing = false,
  }) async {
    if (isRefreshing || state.certificateStateData == null) {
      state = CertificateLoading(certificateData: state.certificateStateData);
    }
    final response =
        await certificateRepository.getCertificateDetails(courseId: courseId);
    response.fold((errorMessage) {
      state = CertificateFailure(
        errorMessage: errorMessage,
        certificateData: state.certificateStateData,
      );
    }, (responsData) {
      state = CertificateSuccess(certificateData: responsData);
    });
  }
}
