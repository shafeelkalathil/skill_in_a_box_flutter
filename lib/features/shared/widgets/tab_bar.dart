import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    required this.rightPadding,
    required this.tabs,
    required this.tabController,
    super.key,
  });
  final List<Widget> tabs;
  final double rightPadding;
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(right: rightPadding),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: orange.shade500,
        ),
        insets: const EdgeInsets.symmetric(horizontal: 16),
      ),
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
