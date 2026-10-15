import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_events/models/my_events_model/my_events_model.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_view_models.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/event_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class UpcomingEvents extends ConsumerWidget {
  const UpcomingEvents({required this.events, super.key});
  final List<Event> events;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingEvents = events
        .where(
          (event) => event.status == 'upcoming',
        )
        .toList();
    return RefreshIndicator(
      color: orange,
      backgroundColor: Colors.white,
      onRefresh: () {
        return ref
            .read(myEventsViewModelProvider.notifier)
            .fetchMyEvents(isRefreshing: true);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: upcomingEvents.isEmpty
            ? ListView(
                children: [
                  SizedBox(
                    height: context.screenHeight * 0.05,
                  ),
                  CustomDataNotFound(
                    imageUrl: Assets.images.noCourses,
                    title: 'No Events',
                    subTitle: "It looks like you don't have "
                        'upcoming events ',
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final upcomingEvent = upcomingEvents[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: EventCard(
                      eventData: upcomingEvent,
                      eventType: EventTypes.upcoming,
                    ),
                  );
                },
                itemCount: upcomingEvents.length,
              ),
      ),
    );
  }
}
