import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/event/models/all_events/all_events_model.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/events_view_model/events_view_model.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/home_top_section.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/section_title.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/course_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';

class UpcomingHomeEvents extends ConsumerWidget {
  const UpcomingHomeEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    return Padding(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      child: Column(
        children: [
          HomeSectionTitle(
            title: 'Upcoming Events',
            actionText: 'All Events',
            onTap: () async {
              await ref.read(eventsViewModelProvider.notifier).fetchEvents();
              await context.router.push(
                const EventRoute(),
              );
            },
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Builder(
            builder: (context) {
              final filteredEvents = filterEvent(homeState, ref);
              if (filteredEvents.isNotEmpty) {
                return CustomGridView(
                  childAspectRatio: context.screenWidth >= 600
                      ? 0.4 + context.screenWidth * 0.001
                      : 0.1 + context.screenWidth * 0.0013,
                  itemLength: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final eventData = filteredEvents[index];
                    return CourseCard(
                      id: eventData.id!,
                      courseTitle: eventData.name ?? 'Title',
                      isEvent: true,
                      lectureCount: '',
                      coursePeriod:
                          '${eventData.startDateTime != null ? DateFormat('MMMM dd').format(
                              DateTime.parse(eventData.startDateTime!),
                            ) : ''} - '
                          '${eventData.endDateTime != null ? DateFormat('MMMM dd, y').format(
                              DateTime.parse(eventData.endDateTime!),
                            ) : ''}',
                      finalPrice: '₹${eventData.pricing?.eventPrice}',
                      imageUrl: eventData.thumbnail?.link ??
                          AppHelpers.defaultNetworkImage,
                    );
                  },
                );
              } else {
                return SizedBox(
                  height: context.screenHeight * 0.1,
                  width: context.screenWidth,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  List<Event> filterEvent(HomeState homeState, WidgetRef ref) {
    final upcomingEvents = homeState.upcomingEvents!.event ?? [];
    final searchTerm = ref.watch(homeSearchProvider).toLowerCase();

    final filteredEvents = upcomingEvents
        .where(
          (event) => event.name?.toLowerCase().contains(searchTerm) ?? false,
        )
        .toList();

    return filteredEvents;
  }
}
