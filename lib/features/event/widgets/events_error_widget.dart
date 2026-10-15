import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_states.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_view_model.dart';

import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class EventErrorWidget extends StatelessWidget {
  const EventErrorWidget({
    required this.eventState,
    required this.ref,
    super.key,
  });

  final EventsFailed eventState;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      errorMessage: eventState.errorMessage,
      onPressed: () {
        ref.read(eventsViewModelProvider.notifier).fetchEvents();
      },
    );
  }
}
