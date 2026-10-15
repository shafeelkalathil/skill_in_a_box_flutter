import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/assignment/widgets/pdf_widget.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/model/doubt_box/section_details_model/doubt_box_section_details_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses_curriculum_overlay_menu/view_model/doubt_box_view_model/doubt_box_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/video_player.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

final isThumbUpSelectedProvider = StateProvider.family<bool, int>(
  (ref, index) => false,
);

final isThumbDownSelectedProvider = StateProvider.family<bool, int>(
  (ref, index) => false,
);

class DoubtItem extends ConsumerStatefulWidget {
  const DoubtItem({
    required this.index,
    required this.doubtData,
    required this.courseId,
    required this.sectionId,
    super.key,
    this.showVideo = false,
  });
  final String courseId;
  final String sectionId;
  final bool showVideo;
  final int index;
  final DoubtBoxData? doubtData;

  @override
  ConsumerState<DoubtItem> createState() => _DoubtItemState();
}

class _DoubtItemState extends ConsumerState<DoubtItem> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(isThumbUpSelectedProvider(widget.index).notifier).state =
          widget.doubtData?.isLiked ?? false;
      ref.read(isThumbDownSelectedProvider(widget.index).notifier).state =
          widget.doubtData?.isDisliked ?? false;

    });
  }

  @override
  Widget build(BuildContext context) {
    final answerType = widget.doubtData?.answerType ?? '';
    final question = widget.doubtData?.question ?? 'question';
    final answerFile = widget.doubtData?.answerFile;
    final answer = widget.doubtData?.answer;
    final thumbUpSelected = ref.watch(isThumbUpSelectedProvider(widget.index));
    final thumbDownSelected =
        ref.watch(isThumbDownSelectedProvider(widget.index));
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: silverChalice.shade100)),
        color: const Color(0xffffffff),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SvgPicture.asset(Assets.icons.lineHorizontal),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    question,
                    style: subtitle3.copyWith(color: silverChalice.shade900),
                  ),
                ),
                const SizedBox(width: 20),
                ThumbIcon(
                  selected: thumbUpSelected,
                  icon: Assets.icons.tumpUp,
                  pressedIcon: Assets.icons.tumpUpPressed,
                  onTap: () {
                    ref
                        .read(
                          doubtBoxViewModelProvider(widget.sectionId).notifier,
                        )
                        .handlingLike(
                          courseId: widget.courseId,
                          sectionId: widget.sectionId,
                          doubtId: widget.doubtData!.id!,
                          type: 'like',
                        );
                    ref
                        .read(isThumbUpSelectedProvider(widget.index).notifier)
                        .state = true;
                    ref
                        .read(
                          isThumbDownSelectedProvider(widget.index).notifier,
                        )
                        .state = false;
                  },
                ),
                const SizedBox(width: 20),
                ThumbIcon(
                  selected: thumbDownSelected,
                  icon: Assets.icons.tumpDown,
                  pressedIcon: Assets.icons.tumpDownPressed,
                  onTap: () {
                    ref
                        .read(isThumbUpSelectedProvider(widget.index).notifier)
                        .state = false;
                    ref
                        .read(
                          isThumbDownSelectedProvider(widget.index).notifier,
                        )
                        .state = true;
                    ref
                        .read(
                          doubtBoxViewModelProvider(widget.sectionId).notifier,
                        )
                        .handlingLike(
                          courseId: widget.courseId,
                          sectionId: widget.sectionId,
                          doubtId: widget.doubtData!.id!,
                          type: 'dislike',
                        );
                  },
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(
                left: context.screenWidth * 0.06,
                bottom: context.screenHeight * 0.02,
              ),
              child: Text(
                answer ??
                    'Find the details related to the resources in the document attached below',
                style: subtitle2.copyWith(color: silverChalice.shade600),
              ),
            ),
            if (answerType == 'video')
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomMuxVideoPlayer(
                  assetId: answerFile?.link ??'',
                ),
              )
            else if (answerType == 'image')
              Padding(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.06,
                ),
                child: InkWell(
                  onTap: () {
                    context.router.push(
                      ImageViewRoute(
                        imageUrl: answerFile?.link ??
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcoffective.com%2Fdefault-featured-image-png%2F&psig=AOvVaw1UybUDuSdZ2747VhXHcqrq&ust=1736053414429000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICbgYyl24oDFQAAAAAdAAAAABAJ',
                      ),
                    );
                  },
                  child: Image.network(
                    answerFile?.link ??
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcoffective.com%2Fdefault-featured-image-png%2F&psig=AOvVaw1UybUDuSdZ2747VhXHcqrq&ust=1736053414429000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICbgYyl24oDFQAAAAAdAAAAABAJ',
                  ),
                ),
              )
            else if (answerType == 'pdf')
              Padding(
                padding: EdgeInsets.only(
                  left: context.screenWidth * 0.06,
                ),
                child: PdfWidget(
                  title: answerFile?.name ?? 'title',
                  link: answerFile?.link ?? '',
                ),
              ),
            SizedBox(height: context.screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}

class ThumbIcon extends StatelessWidget {
  const ThumbIcon({
    required this.selected,
    required this.icon,
    required this.pressedIcon,
    required this.onTap,
    super.key,
  });
  final bool selected;
  final String icon;
  final String pressedIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(selected ? pressedIcon : icon),
    );
  }
}
