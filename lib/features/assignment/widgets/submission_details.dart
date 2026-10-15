import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_states.dart';
import 'package:skill_in_a_box_flutter/features/assignment/view_models/assignment_upload_view_model/assignment_upload_view_model.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/add_submission_button.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/white_card_background.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class SubmissionDetails extends ConsumerWidget {
  const SubmissionDetails({required this.lessonId, super.key});
  final String lessonId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(assignmentUploadViewModelProvider(lessonId));
    final today = DateTime.now();
    return WhiteCardBackground(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Submission',
                style: heading3.copyWith(color: silverChalice.shade700),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.calendar,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      orange,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    DateFormat('MMM dd, y').format(today),
                    style: subtitle3.copyWith(color: silverChalice.shade400),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.time,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    DateFormat('HH:mm').format(today),
                    style: subtitle3.copyWith(color: silverChalice.shade400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: uploadState.pickedFileList?.length ?? 0,
            itemBuilder: (context, index) {
              final uploadFile = uploadState.pickedFileList![index];

              return InkWell(
                onTap: () {
                  context.router.push(
                    PdfViewRoute(
                      title: uploadFile.name,
                      pickedFile: File(uploadFile.path!),
                      isNetwork: false,
                    ),
                  );
                },
                child: WhiteCardBackground(
                  verticalPadding: context.screenWidth * 0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.pdfRed),
                          SizedBox(
                            width: context.screenWidth * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                uploadFile.name,
                                style: heading4.copyWith(
                                  color: silverChalice.shade900,
                                ),
                              ),
                              SizedBox(
                                height: context.screenWidth * 0.005,
                              ),
                              Text(
                                '${bytesToMBString(uploadFile.size)} MB',
                                style: heading4.copyWith(
                                  color: silverChalice.shade900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (uploadState is AssignmentUploadLoading)
                        CircularProgressIndicator(
                          color: forestGreen,
                          value: uploadState.uploadStatus[index],
                        )
                      else
                        InkWell(
                          onTap: () {
                            ref
                                .read(
                                  assignmentUploadViewModelProvider(
                                    lessonId,
                                  ).notifier,
                                )
                                .removeFile(index);
                          },
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: orange,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: context.screenHeight * 0.01,
              );
            },
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          if (uploadState is AssignmentUploadLoading)
            const SizedBox.shrink()
          else
            AddSubmissionButton(lessonId: lessonId),
        ],
      ),
    );
  }

  String bytesToMBString(int bytes) {
    return (bytes / (1024 * 1024)).toStringAsFixed(2);
  }
}
