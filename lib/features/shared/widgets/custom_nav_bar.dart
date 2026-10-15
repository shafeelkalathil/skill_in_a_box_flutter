import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
    super.key, this.navBarFontSize,
  });

  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double? navBarFontSize;

  Widget _buildItem(
    PersistentBottomNavBarItem item,
    bool isSelected,
    BuildContext context,
  ) {
    return SizedBox(
      height: context.screenHeight * 0.09,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: isSelected ? orange : Colors.transparent,
            width: 32,
            height: 2,
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Flexible(
            child: item.icon,
          ),
          SizedBox(height: context.screenHeight * 0.005),
          Material(
            type: MaterialType.transparency,
            child: FittedBox(
              child: Text(
                item.title!,
                style: heading4.copyWith(
                    color: isSelected ? orange : silverChalice.shade500,
                    fontSize: navBarFontSize,),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Container(
      width: double.infinity,
      color: dark ? Colors.black : const Color(0xffffffff),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          final index = items.indexOf(item);
          return Flexible(
            child: GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: _buildItem(item, selectedIndex == index, context),
            ),
          );
        }).toList(),
      ),
    );
  }
}
