import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/event/models/event_list/event_list_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/course_card.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/grid_view.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

final eventSearchQueryProvider = StateProvider<String>((ref) => '');

class EventSuccessWidget extends ConsumerWidget {
  const EventSuccessWidget({
    required this.dark,
    required this.events,
    super.key,
  });

  final bool dark;
  final EventListModel events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredEvents = events.event!
        .where(
          (event) => event.name!
              .toLowerCase()
              .contains(ref.watch(eventSearchQueryProvider)),
        )
        .toList();
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
              left: context.screenWidth * 0.06,
              right: context.screenWidth * 0.06,
              bottom: context.screenWidth * 0.02,
            ),
            child: TextFormField(
              onChanged: (value) {
                ref.read(eventSearchQueryProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    Assets.icons.search,
                  ),
                ),
                hintText: 'Search',
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (events.event == null)
                  Container(
                    padding: EdgeInsets.only(top: context.screenHeight * 0.2),
                    child: Text(
                      'No Events',
                      style: subtitle1.copyWith(color: silverChalice.shade900),
                    ),
                  )
                else
                  CustomGridView(
                    childAspectRatio: context.screenWidth >= 600
                        ? 0.4 + context.screenWidth * 0.001
                        : 0.1 + context.screenWidth * 0.0012,
                    itemLength: filteredEvents.length,
                    itemBuilder: (context, index) {
                      final eventData = filteredEvents[index];
                      final finalPrice = (eventData.pricing?.eventPrice ?? 0) -
                          (eventData.pricing?.discountPrice ?? 0);

                      return CourseCard(
                        id: eventData.id!,
                        courseTitle: eventData.name ?? 'Title',
                        coursePeriod:
                            '${eventData.startDateTime != null ? DateFormat('MMMM dd').format(
                                DateTime.parse(eventData.startDateTime!),
                              ) : ''} - '
                            '${eventData.endDateTime != null ? DateFormat('MMMM dd, y').format(
                                DateTime.parse(eventData.endDateTime!),
                              ) : ''}',
                        finalPrice: '₹$finalPrice',
                        originalPrice:
                            '₹${eventData.pricing?.eventPrice?.toString() ?? '0'}',
                        isEvent: true,
                        imageUrl: eventData.thumbnail?.link ??
                            AppHelpers.defaultNetworkImage,
                        lectureCount: '',
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
