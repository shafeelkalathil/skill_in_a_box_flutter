import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';

class ViewMoreButton extends StatefulWidget {

  const ViewMoreButton({required this.checkViewMore, super.key});
  final bool checkViewMore;

  @override
  State<ViewMoreButton> createState() => _ViewMoreButtonState();
}

class _ViewMoreButtonState extends State<ViewMoreButton> {
  bool isViewMore = false;

  @override
  void initState() {
    super.initState();
    isViewMore = widget.checkViewMore;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isViewMore = !isViewMore;
        });
      },
      child: Text(
        isViewMore ? 'Show Less' : 'View More',
        style: heading4.copyWith(color: orange.shade500),
      ),
    );
  }
}
