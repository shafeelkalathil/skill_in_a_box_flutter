import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {

  final List<String> certificates = ['',''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
          child: Text(
            'Certificate',
            style: heading1.copyWith(color: silverChalice.shade900),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: certificates.isEmpty
              ? CustomDataNotFound(
              imageUrl: Assets.images.noCertificate,
              title: 'No Certificate yet!',
              subTitle: 'The certificate will be awarded upon\n'
                 'successful completion of the course.',)
              : SingleChildScrollView(
            child: Column(
              children: [
                CustomGridView(
                  itemLength: certificates.length,
                  itemBuilder: (context, index) {
                    return RoundedContainer(
                      isSymmetricPadding: true,
                      widget: Column(
                        children: [
                          SvgPicture.asset(Assets.images.certificate),
                          const SizedBox(height: 5,),
                          Text('Course Certificate',style: heading3.copyWith(
                              fontSize: 14,color: silverChalice.shade900,),),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Assets.icons.calender),
                              const SizedBox(width: 4,),
                              Text('May 11,2024',
                                style: heading4.copyWith(
                                    color: silverChalice.shade500,),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
