import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/event_items_menu.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/sections.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class EventOutcomes extends StatelessWidget {
  const EventOutcomes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: 'Event Outcomes'),
        SizedBox(height: context.screenHeight * 0.015),
        EventItemsMenu(
          text: 'Design Expertise: Acquire a deep understanding of design '
              'concepts, techniques, and processes, enabling you to create '
              'innovative and aesthetically pleasing fashion collections.',
          widget: SvgPicture.asset(Assets.icons.tick),
        ),
        EventItemsMenu(
          text:
              'Technical Skills: Develop practical skills in sketching, pattern'
              ' drafting, sewing, draping, and garment construction, honing '
              'your ability to bring your design concepts to life.',
          widget: SvgPicture.asset(Assets.icons.tick),
        ),
        EventItemsMenu(
          text:
              'Portfolio Development: Build a professional portfolio showcasing'
              ' your design projects, demonstrating your creativity, technical'
              ' proficiency, and unique design style to potential employers,'
              ' clients, or fashion schools.',
          widget: SvgPicture.asset(Assets.icons.tick),
        ),
      ],
    );
  }
}
