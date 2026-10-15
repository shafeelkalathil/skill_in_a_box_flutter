import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/certificate/certificate_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CertificateSuccessWidget extends StatelessWidget {
  const CertificateSuccessWidget({required this.certificateModel, super.key});
  final CertificateModel certificateModel;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: context.screenPadding),
          CustomGridView(
            childAspectRatio: context.screenWidth >= 600
                ? 0.4 + context.screenWidth * 0.001
                : 0.1 + context.screenWidth * 0.002,
            itemLength: certificateModel.certificates?.length ?? 0,
            itemBuilder: (context, index) {
              final courseDetails = certificateModel.certificates![index];
              return InkWell(
                onTap: () {
                  context.router.push(
                    CertificateViewRoute(
                      pdfUrl: courseDetails.link??'',
                    ),
                  );
                },
                child: RoundedContainer(
                  isPadding: false,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            Assets.images.record,
                          ),
                          Center(
                            child: Image.asset(
                                Assets.images.certificateImage.path),
                          ),
                        ],
                      ),
                      Text(
                        courseDetails.name ?? 'name',
                        style: heading3.copyWith(
                          fontSize: 14,
                          color: dark ? Colors.white : silverChalice.shade900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.calender),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            DateFormat('MMMM dd,y')
                                .format(courseDetails.date ?? DateTime.now()),
                            style: heading4.copyWith(
                              color: dark
                                  ? const Color(0xffD3D3D3)
                                  : silverChalice.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
