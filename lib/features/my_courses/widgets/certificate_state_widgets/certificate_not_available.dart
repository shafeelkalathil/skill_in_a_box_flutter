import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CertificateNotAvailableWidget extends StatelessWidget {
  const CertificateNotAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.08,
        left: context.screenPadding,
        right: context.screenPadding,
      ),
      child: CustomDataNotFound(
        imageUrl: Assets.images.noCertificate,
        title: 'No Certificate yet!',
        subTitle: 'The certificate will be awarded upon successful '
            'completion of the course.',
      ),
    );
  }
}
