import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/event/view_models/event_details_view_model/event_details_state.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/bottom_widget.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/event_details_loading.dart';
import 'package:skill_in_a_box_flutter/features/event/widgets/sections.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_event_details_view_model/my_event_details_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/error_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/overview_content.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/video_player.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class EventDetailsScreen extends ConsumerStatefulWidget {
  const EventDetailsScreen({
    required this.eventType,
    required this.eventId,
    this.eventTitle,
    super.key,
  });

  final EventTypes eventType;
  final String? eventTitle;
  final String eventId;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  bool checkViewMore = false;

  @override
  Widget build(BuildContext context) {
    final eventDetailsState = ref.watch(myEventDetailsViewModelProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.eventType == EventTypes.notPurchased
            ? 'Events Details'
            : widget.eventTitle ?? 'Title',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: SingleChildScrollView(
            child: Builder(
              builder: (context) {
                if (eventDetailsState is EventDetailsSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.screenHeight * 0.01),
                      Builder(
                        builder: (context) {
                          if (widget.eventType == EventTypes.notPurchased ||
                              widget.eventType == EventTypes.upcoming) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (eventDetailsState
                                        .eventData.event?.trailer?[0].link !=
                                    null)
                                  SizedBox(
                                    height: 234,
                                    child: CustomMuxVideoPlayer(
                                      assetId: eventDetailsState.eventData.event
                                              ?.trailer?[0].link ??
                                          '',
                                    ),
                                  ),
                                SizedBox(height: context.screenHeight * 0.02),
                                SectionTitle(
                                  text: widget.eventTitle ?? 'Title',
                                ),
                                SizedBox(height: context.screenHeight * 0.025),
                                SectionRow(
                                  iconPath: Assets.icons.calender,
                                  text: getDate(
                                    eventDetailsState
                                        .eventData.event?.startDateTime,
                                    eventDetailsState
                                        .eventData.event?.endDateTime,
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.02),
                                SectionRow(
                                  iconPath: Assets.icons.timer,
                                  text: getTime(
                                    eventDetailsState
                                        .eventData.event?.startDateTime,
                                    eventDetailsState
                                        .eventData.event?.endDateTime,
                                  ),
                                ),
                                SizedBox(height: context.screenHeight * 0.025),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      CustomOverViewContent(
                        title: 'Description',
                        subTitleContent: [
                          eventDetailsState.eventData.event?.description ??
                              'Description',
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomOverViewContent(
                        title: 'Event Requirements',
                        subTitleHeading: splitSentence(
                          isBeforeColon: true,
                          sentenceList:
                              eventDetailsState.eventData.event?.requirements ??
                                  [],
                        ),
                        subTitleContent: splitSentence(
                          isBeforeColon: false,
                          sentenceList:
                              eventDetailsState.eventData.event?.requirements ??
                                  [],
                        ),
                        isShowIcon: true,
                        iconWidget: CircleAvatar(
                          radius: 5,
                          backgroundColor: orange.shade500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomOverViewContent(
                        title: 'Event Outcomes',
                        subTitleHeading: splitSentence(
                          isBeforeColon: true,
                          sentenceList:
                              eventDetailsState.eventData.event?.outcomes ?? [],
                        ),
                        subTitleContent: splitSentence(
                          isBeforeColon: false,
                          sentenceList:
                              eventDetailsState.eventData.event?.outcomes ?? [],
                        ),
                        isShowIcon: true,
                        iconWidget: SvgPicture.asset(Assets.icons.tick),
                      ),
                      SizedBox(height: context.screenHeight * 0.15),
                    ],
                  );
                } else if (eventDetailsState is EventDetailsFailed) {
                  return Padding(
                    padding: EdgeInsets.only(top: context.screenHeight * 0.3),
                    child: CustomErrorWidget(
                      errorMessage: eventDetailsState.errorMessage,
                      onPressed: () {
                        ref
                            .read(myEventDetailsViewModelProvider.notifier)
                            .fetchEventDetails(widget.eventId, isMyEvent: true);
                      },
                    ),
                  );
                } else {
                  return const EventDetailsLoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
      bottomSheet: (eventDetailsState is EventDetailsSuccess)
          ? EventBottomWidget(
              eventType: widget.eventType,
              eventId : widget.eventId,
              finalPrice:
                  '₹${getPrice(eventPrice: eventDetailsState.eventData.event?.pricing?.eventPrice.toString(), discountPrice: eventDetailsState.eventData.event?.pricing?.discountPrice.toString())}',
            )
          : const SizedBox.shrink(),
    );
  }

  List<String> splitSentence({
    required List<String> sentenceList,
    required bool isBeforeColon,
  }) {
    final trimmedList = <String>[];

    for (final item in sentenceList) {
      final parts = item.split(':');
      if (parts.length >= 2) {
        trimmedList
            .add(isBeforeColon ? '${parts[0].trim()} : ' : parts[1].trim());
      } else {
        if (!isBeforeColon) {
          trimmedList.add(item);
        }
      }
    }
    return trimmedList;
  }

  String getPrice({String? eventPrice, String? discountPrice}) {
    if (eventPrice == null || eventPrice.isEmpty || eventPrice == 'null') {
      return '0';
    }

    if (discountPrice == null ||
        discountPrice.isEmpty ||
        discountPrice == '0' ||
        discountPrice == 'null') {
      return eventPrice;
    }

    final basePrice = int.tryParse(eventPrice);
    final discount = int.tryParse(discountPrice);

    if (basePrice == null || discount == null) {
      return eventPrice;
    }

    final finalPrice = basePrice - discount;
    return finalPrice.toString();
  }

  String getDate(String? fromDate, String? toDate) {
    if (fromDate == null && toDate == null) return '';

    final date = fromDate ?? toDate!;
    final formatter = DateFormat('MMMM dd, y');

    if (fromDate == null ||
        toDate == null ||
        DateFormat('MMMM dd').format(DateTime.parse(fromDate)) ==
            DateFormat('MMMM dd').format(DateTime.parse(toDate))) {
      return formatter.format(DateTime.parse(date));
    }

    return '${DateFormat('MMMM dd').format(DateTime.parse(fromDate))} - '
        '${DateFormat('dd, y').format(DateTime.parse(toDate))}';
  }

  String getTime(String? fromDate, String? toDate) {
    if (fromDate == null && toDate == null) return '';

    final date = fromDate ?? toDate!;
    final formatter = DateFormat(' hh:mm a');

    if (fromDate == null ||
        toDate == null ||
        DateFormat('hh:mm a').format(DateTime.parse(fromDate)) ==
            DateFormat('hh:mm a').format(DateTime.parse(toDate))) {
      return formatter.format(DateTime.parse(date));
    }

    return '${DateFormat(' hh:mm a').format(DateTime.parse(fromDate))} - '
        '${DateFormat('hh:mm a').format(DateTime.parse(toDate))}';
  }
}
