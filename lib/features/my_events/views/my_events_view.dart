import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_states.dart';
import 'package:skill_in_a_box_flutter/features/my_events/view_models/my_events_view_model/my_events_view_models.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/state_widgets/my_events_content.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/state_widgets/my_events_error.dart';
import 'package:skill_in_a_box_flutter/features/my_events/widgets/state_widgets/my_events_loading.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/tab_bar.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class MyEventsScreen extends ConsumerStatefulWidget {
  const MyEventsScreen({super.key});

  @override
  ConsumerState<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends ConsumerState<MyEventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myEventsState = ref.watch(myEventsViewModelProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Events',
        bottomWidget: CustomTabBar(
          tabController: tabController,
          rightPadding: context.screenWidth * 0.25,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          if (myEventsState is MyEventsLoading) {
            return const MyEventsLoadingWidget();
          } else {
            if (myEventsState.myEventsModel == null) {
             return myEventsState is MyEventsFailed
                  ? MyEventsErrorWidget(myEventsFailureState: myEventsState)
                  : GestureDetector(
                      onTap: () {
                        print('state is $myEventsState');
                      },
                      child: CustomDataNotFound(
                        imageUrl: Assets.images.noCourses,
                        title: 'No Events',
                        subTitle: "It looks like you haven't "
                            'purchased any events yet. ',
                      ),
                    );
            } else {
              return MyEventsContentWidget(controller: tabController);
            }
          }
        },
      ),
    );
  }
}
