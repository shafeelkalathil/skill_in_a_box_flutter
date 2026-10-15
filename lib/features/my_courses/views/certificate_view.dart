import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/certificate_view_model/cerificate_states.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/certificate_view_model/certificate_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/certificate_state_widgets/certificate_error.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/certificate_state_widgets/certificate_loading.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/certificate_state_widgets/certificate_not_available.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/certificate_state_widgets/certificate_success.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

class CertificateView extends ConsumerWidget {
  const CertificateView({required this.courseId, super.key});
  final String courseId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certificateState =
        ref.watch(selfLearningCertificateViewModelProvider(courseId));
    return Scaffold(
      appBar: const CustomAppBar(title: 'Certificate'),
      body: RefreshIndicator(
        onRefresh: () {
          return ref
              .read(selfLearningCertificateViewModelProvider(courseId).notifier)
              .getCertificate(courseId: courseId);
        },
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: context.screenPadding),
            child: Builder(
              builder: (context) {
                if (certificateState is CertificateLoading) {
                  return const CertificateLoadingWidget();
                } else {
                  if (certificateState.certificateStateData?.certificates ==
                      null) {
                    return certificateState is CertificateFailure
                        ? CertificateErrorWidget(
                            courseId: courseId,
                            errorMessage: certificateState.errorMessage,
                          )
                        : const CertificateNotAvailableWidget();
                  } else {
                    return CertificateSuccessWidget(
                      certificateModel: certificateState.certificateStateData!,
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
