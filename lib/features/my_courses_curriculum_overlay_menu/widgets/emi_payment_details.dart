import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/widgets/installment_section.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/custom_transparent_button.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/status_badge.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class EmiPaymentDetails extends StatelessWidget {
  const EmiPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Column(
      children: [
        const SizedBox(height: 20),
        buildEMIDetailsSection(context,dark: dark ),
        const SizedBox(height: 20),
        buildPaymentDetailSection(context,dark: dark),
        const SizedBox(height: 20),
        buildUploadedDocumentsSection(context,dark: dark),
      ],
    );
  }

  Widget buildEMIDetailsSection(BuildContext context,{required bool dark}) {
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderWithStatus('EMI Details', 'In process',
              orange.shade200, orange.shade300,dark: dark,),
          const SizedBox(height: 10),
          buildEMIDetailRow('EMI Amount', '72,000', 'Tenure',
              '-',context,dark: dark,),
          buildEMIDetailRow('Finance Partner', '-',
              'EMI Per Month', '-',context,dark: dark,),
        ],
      ),
    );
  }

  Widget buildPaymentDetailSection(BuildContext context,{required bool dark}) {
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle('Payment Detail',context,
              showCloseButton: false,dark: dark,),
          const SizedBox(height: 10),
          const InstallmentSection(
            title: 'Registration Fee',
            amount: '₹ 3,000.00',
            status: true,
            bgColor: Colors.greenAccent,
            textColor: Colors.green,
            isSelected: false,
          ),
        ],
      ),
    );
  }

  Widget buildUploadedDocumentsSection(BuildContext context,
      {required bool dark,}) {
    return RoundedContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderWithAddOption(context, 'Uploaded Documents',
              'Add More',dark: dark,),
          const SizedBox(height: 10),
          buildDocumentStatusSection(dark: dark),
        ],
      ),
    );
  }

  Widget buildHeaderWithStatus(String title, String status, Color bgColor,
      Color textColor,{required bool dark,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(title, style: heading3.copyWith(
            color: dark ? Colors.white : silverChalice.shade900,),),),
        StatusBadge(bgColor: bgColor, color: textColor, value: status),
      ],
    );
  }

  Widget buildHeaderWithAddOption(BuildContext context, String title,
      String addText,{required bool dark,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title, style: heading3.copyWith(
            color: dark ? Colors.white : silverChalice.shade900,),),),
        GestureDetector(
          onTap: () => showCurvedBottomSheet(context,dark: dark),
          child: Row(
            children: [
              Icon(Icons.add, color: orange.shade500,size: 15,),
              Text(addText, style: subtitle2.copyWith(color: orange.shade500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEMIDetailRow(String title1, String value1,
      String title2, String value2,BuildContext context,{required bool dark,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildEMIDetailColumn(title1, value1,context,dark: dark),
        buildEMIDetailColumn(title2, value2,context,dark: dark),
      ],
    );
  }

  Widget buildEMIDetailColumn(String title, String value,BuildContext context,
      {required bool dark,}) {
    return SizedBox(
      width: context.screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: heading5.copyWith(color: dark
              ? const Color(0xffD3D3D3)
              :silverChalice.shade500,),),
          const SizedBox(height: 10),
          Text(value, style: subtitle4.copyWith(fontSize: 16,
              color: dark ? const Color(0xffD3D3D3): silverChalice.shade700,),),
        ],
      ),
    );
  }

  Widget buildTitle(String text,BuildContext context,
      {required bool showCloseButton,required bool dark,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(text, style: heading3.copyWith(
            color: dark ? Colors.white : silverChalice.shade900,),),),
        if(showCloseButton)IconButton(
          icon: Icon(Icons.close, color: dark
              ? Colors.white:silverChalice.shade600,),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget buildDocumentStatusSection({required bool dark}) {
    return RoundedContainer(
      borderColor: dark
          ? Colors.transparent
          : const Color(0xffE7E7E7),
      bgColor:  const Color(0xff222223) ,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('Aadhaar Card', style: heading4.copyWith(
                  color: dark ? Colors.white :silverChalice.shade900,),),),
              StatusBadge(bgColor: Colors.red.shade100, color: Colors.red,
                  value: 'Rejected',),
            ],
          ),
          const SizedBox(height: 10),
          Text('Remarks', style: body1.copyWith(color: dark
              ? const Color(0xffD3D3D3) :const Color(0xffAAAAAA),),),
          const SizedBox(height: 10),
          Text('Please reupload the following document',
              style: heading4.copyWith(color: dark
                  ? const Color(0xffD3D3D3) :silverChalice.shade700,),),
        ],
      ),
    );
  }

  void showCurvedBottomSheet(BuildContext context,{required bool dark}) {
    // ignore: inference_failure_on_function_invocation
    showModalBottomSheet(
      context: context,
      backgroundColor: dark
          ? const Color(0xff2C2C2E) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
            vertical: context.screenHeight * 0.02,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: context.screenWidth * 0.15,
                  height: context.screenHeight * 0.005,
                  decoration: BoxDecoration(
                    color: dark
                        ? const Color(0xff222223):Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildTitle('Course Validity Extension',context,
                  showCloseButton: true,dark: dark,),
              const SizedBox(height: 15),
              CustomTextField(
                readOnly: true,
                controller: TextEditingController(),
                hintText: 'Select Document Type',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(Assets.icons.arrowDown),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: context.screenWidth * 0.9,
                height: 134,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: dark ? const Color(0xff222223) : Colors.transparent,
                ),
                child: DottedBorder(
                  dashPattern: const [12],
                  color: dark  ?  Colors.transparent :silverChalice.shade100,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth*0.06,),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'choose ',
                                  style: subtitle4.copyWith(
                                      color: orange.shade500,),
                                ),
                                TextSpan(
                                  text: 'upload to file',
                                  style: subtitle4.copyWith(
                                      color: silverChalice.shade900,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(Assets.icons.uploadDoc),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: CustomTransparentButton(
                      text: 'Cancel',
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){},
                        child: const Text('Upload'),),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
