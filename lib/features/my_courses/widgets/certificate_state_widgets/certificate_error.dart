import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/certificate_view_model/certificate_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class CertificateErrorWidget extends ConsumerWidget {
  const CertificateErrorWidget({
    required this.courseId,
    required this.errorMessage,
    super.key,
  });
  final String courseId;
  final String errorMessage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomErrorWidget(
      errorMessage: errorMessage,
      onPressed: () {
        ref
            .read(selfLearningCertificateViewModelProvider(courseId).notifier)
            .getCertificate(courseId: courseId);
      },
    );
  }
}
