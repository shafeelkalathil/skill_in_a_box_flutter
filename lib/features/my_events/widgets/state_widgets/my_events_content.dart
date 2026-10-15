import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_view_models.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/completed_events.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/ongoing_events.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/upcoming_events.dart';

class MyEventsContentWidget extends ConsumerWidget {
  const MyEventsContentWidget({
    required this.controller,
    super.key,
  });
  final TabController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myEventsState = ref.watch(myEventsViewModelProvider);
    return TabBarView(
      controller: controller,
      children: [
        UpcomingEvents(
          events: myEventsState.myEventsModel?.event ?? [],
        ),
        OngoingEvents(events: myEventsState.myEventsModel?.event ?? []),
        CompletedEvents(events: myEventsState.myEventsModel?.event ?? []),
      ],
    );
  }
}
