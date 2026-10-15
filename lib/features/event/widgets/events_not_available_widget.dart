import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class EventsNotAvailableWidget extends StatelessWidget {
  const EventsNotAvailableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDataNotFound(
      imageUrl: Assets.images.noCourses,
      title: 'No Events',
      subTitle: 'It looks like there is no upcoming events ',
    );
  }
}
