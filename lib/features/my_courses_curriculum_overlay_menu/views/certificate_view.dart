import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/certificate_view_model/certificate_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/certificate_view_model/certificate_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class CertificateScreen extends ConsumerStatefulWidget {
  const CertificateScreen({required this.courseId,super.key});
  final String courseId;

  @override
  ConsumerState<CertificateScreen> createState() =>
      _KitInformationScreenState();
}

class _KitInformationScreenState extends ConsumerState<CertificateScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(certificateViewModelNotifier.notifier)
        .getCertificateDetails(courseId: widget.courseId),);
  }

  @override
  Widget build(BuildContext context) {
    final certificateState = ref.watch(certificateViewModelNotifier);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Certificate'),
      body: certificateState is CertificateLoading
          ? Center(child: CircularProgressIndicator(color: orange.shade500,),)
          :certificateState is CertificateFailure
          ? Center(child: Text(certificateState.message),)
          :certificateState is CertificateSuccess
          ? SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),

          child: certificateState.certificateModel?.certificates == null ||
              certificateState.certificateModel!.certificates!.isEmpty ||
              certificateState.certificateModel.isCertified == false
              ? CustomDataNotFound(
              imageUrl: Assets.images.noCertificate,
              title: 'No Certificate yet!',
              subTitle: 'The certificate will be awarded upon successful '
                  'completion of the course.',)
              :CustomGridView(
            childAspectRatio:
            context.screenWidth >= 600
                ? 0.4 +
                context.screenWidth *
                    0.001
                : 0.1 +
                context.screenWidth *
                    0.002,
            itemLength: certificateState
              .certificateModel.certificates?.length ?? 0,   
            itemBuilder: (context, index) {
              final courseDetails =
              certificateState.certificateModel.certificates![index];
              return InkWell(
                onTap: () {
                  context.router.push(
                    CertificateViewRoute(
                      pdfUrl:courseDetails?.link ?? '' ,
                    ),
                  );
                },
                child: RoundedContainer(
                  isPadding: false,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(Assets.images.record,),
                      Text(courseDetails?.name ?? '',style: heading3.copyWith(
                        fontSize: 14,color: dark
                          ? Colors.white:silverChalice.shade900,),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.calender),
                          const SizedBox(width: 4,),
                          Text('May 11,2024',style: heading4.copyWith(
                            color: dark
                                ? const Color(0xffD3D3D3)
                                :silverChalice.shade500,),),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )
          :const SizedBox.shrink(),
    );
  }
}
