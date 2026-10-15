import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_state.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/view_model/my_course_view_model/my_course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/state_widgets/my_course_content.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/state_widgets/my_course_error.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/state_widgets/my_course_loading.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/tab_bar.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class MyCoursesScreen extends ConsumerStatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  ConsumerState<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends ConsumerState<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myCourseViewModelProvider, (previous, current) {
      if (current is MyCourseFailure && (current.listOfMyCourses != null)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              current.message,
            ),
            backgroundColor: red.shade500,
          ),
        );
      }
    });
    final mycourseState = ref.watch(myCourseViewModelProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Courses',
        bottomWidget: CustomTabBar(
          tabController: tabController,
          rightPadding: context.screenWidth * 0.15,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Ongoing'),
            Tab(text: 'Registered'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          if (mycourseState is MyCourseLoading) {
            return const MyCourseLoadingWidget();
          } else {
            if (mycourseState.myCourseList == null) {
              return mycourseState is MyCourseFailure
                  ? MyCourseErrorWidget(myCourseFailureState: mycourseState)
                  : CustomDataNotFound(
                      imageUrl: Assets.images.noCourses,
                      title: 'No Courses',
                      subTitle: "It looks like you haven't "
                          'purchased any courses yet. ',
                    );
            } else {
              return MyCourseContentWidget(
                controller: tabController,
              );
            }
          }
        },
      ),
    );
  }
}
