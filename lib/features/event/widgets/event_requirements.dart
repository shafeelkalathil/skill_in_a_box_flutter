import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/event_items_menu.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/sections.dart';

class EventRequirements extends StatelessWidget {
  const EventRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: 'Event Requirements'),
        SizedBox(height: context.screenHeight * 0.015),
        EventItemsMenu(
          text:
              'Basic Drawing Skills: While not mandatory, having basic drawing'
              ' skills or a willingness to learn sketching techniques will '
              'enhance your ability to communicate design ideas visually.',
          widget: CircleAvatar(
            radius: 5,
            backgroundColor: orange.shade500,
          ),
        ),
        EventItemsMenu(
          text: 'Sewing Skills (Optional): Basic knowledge of sewing or a '
              'willingness to learn sewing techniques will be advantageous, '
              'especially for hands-on garment construction projects. The '
              'course may include sewing workshops for beginners.',
          widget: CircleAvatar(
            radius: 5,
            backgroundColor: orange.shade500,
          ),
        ),
        EventItemsMenu(
          text: 'Creativity and Passion: A strong passion for fashion and a '
              'creative mindset are fundamental prerequisites for this course.',
          widget: CircleAvatar(
            radius: 5,
            backgroundColor: orange.shade500,
          ),
        ),
      ],
    );
  }
}
