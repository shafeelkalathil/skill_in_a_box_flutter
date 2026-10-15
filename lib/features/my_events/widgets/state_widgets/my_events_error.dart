import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_states.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_view_models.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';

class MyEventsErrorWidget extends ConsumerWidget {
  const MyEventsErrorWidget({
    required this.myEventsFailureState,
    super.key,
  });
  final MyEventsFailed myEventsFailureState;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomErrorWidget(
      errorMessage: myEventsFailureState.errorMessage,
      onPressed: () {
        ref.read(myEventsViewModelProvider.notifier).fetchMyEvents();
      },
    );
  }
}
