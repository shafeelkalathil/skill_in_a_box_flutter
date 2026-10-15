import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_states.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_view_model.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/event_success_widget.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/events_error_widget.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/events_loading_widget.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/events_not_available_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';

@RoutePage()
class EventScreen extends ConsumerStatefulWidget {
  const EventScreen({super.key});

  @override
  ConsumerState<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends ConsumerState<EventScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(eventsViewModelProvider, (previous, current) {
      if (current is EventsFailed && (current.events != null)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.errorMessage,
            ),
            backgroundColor: red.shade500,
          ),
        );
      }
    });
    final eventState = ref.watch(eventsViewModelProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Events'),
      body: RefreshIndicator(
        color: orange,
        backgroundColor: Colors.white,
        onRefresh: () {
          return ref
              .read(eventsViewModelProvider.notifier)
              .fetchEvents(isRefreshing: true);
        },
        child: SafeArea(
          child: Builder(
            builder: (context) {
              if (eventState is EventsLoading) {
                return const EventsLoadingWidget();
              } else {
                if (eventState.events?.event == null) {
                  return eventState is EventsFailed
                      ? EventErrorWidget(eventState: eventState, ref: ref)
                      : const EventsNotAvailableWidget();
                } else {
                  return EventSuccessWidget(
                    dark: dark,
                    events: eventState.events!,
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
