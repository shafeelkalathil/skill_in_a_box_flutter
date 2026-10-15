import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/leader_board/leader_board_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/leader_board_card.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/overlaymenu.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/rouded_container.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class LeaderBoardView extends ConsumerStatefulWidget {
  const LeaderBoardView({required this.courseId, super.key});
  final String courseId;

  @override
  ConsumerState<LeaderBoardView> createState() => _LeaderBoardViewState();
}

class _LeaderBoardViewState extends ConsumerState<LeaderBoardView> {
  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }
  @override
  Widget build(BuildContext context) {

    final leaderBoardData = ref.watch(
      getLeaderBoardDetailsProvider(widget.courseId),);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Leaderboard'),
      body: Stack(
        children: [
          leaderBoardData.when(data: (data) {
            final sortedStudents = List.of(
              data.students,)
              ..sort((a, b) =>
                  b.points.compareTo(a.points),);
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.1,),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RoundedContainer(
                        widget: SizedBox(
                          height: context.screenHeight * 0.4,
                          child: SvgPicture.asset(
                              Assets.images.leaderboard,
                            height: context.screenWidth *0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (sortedStudents.length > 3) Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: sortedStudents.length - 3,
                          itemBuilder: (context, index) {
                            // final student = sortedStudents[index];
                            return const LeaderBoardCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),),
          if (_showOverlay)
            OverlayMenu(
              courseId: widget.courseId,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        onPressed: _toggleOverlay,
        child: _showOverlay
            ? SvgPicture.asset(Assets.icons.closeCircle)
            : SvgPicture.asset(Assets.icons.addCircle),
      ),
    );
  }
}
