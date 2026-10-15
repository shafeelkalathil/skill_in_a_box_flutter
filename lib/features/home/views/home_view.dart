import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_states.dart';
import 'package:skill_in_a_box_flutter/features/home/view_model/home_view_model.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/home_app_bar.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/home_error_widget.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/home_loading.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/home_top_section.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/popular_courses.dart';
import 'package:skill_in_a_box_flutter/features/home/widgets/upcoming_events.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(homeViewModelProvider.notifier).fetchHomeData();
        ref
            .read(basicDetailsViewModelProvider.notifier)
            .fetchUserBasicDetails();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeViewModelProvider, (previous, current) {
      if (current is HomeFailure &&
          (current.listOfPopularCourses != null) &&
          (current.listOfUpcomingEvents != null)) {
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
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: RefreshIndicator(
        color: orange,
        backgroundColor: Colors.white,
        onRefresh: () {
          ref
              .read(basicDetailsViewModelProvider.notifier)
              .fetchUserBasicDetails();
          return ref
              .read(homeViewModelProvider.notifier)
              .fetchHomeData(isRefreshing: true);
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                floating: true,
                flexibleSpace: HomeAppBar(),
              ),
              SliverToBoxAdapter(
                child: HomeTopSection(),
              ),
              SliverToBoxAdapter(
                child: Builder(
                  builder: (context) {
                    if (homeState is HomeLoading) {
                      return const HomeLoadingWidget();
                    } else {
                      if (homeState.popularCourse == null &&
                          homeState.upcomingEvents == null) {
                        return homeState is HomeFailure
                            ? HomeErrorWidget(homeState: homeState, ref: ref)
                            : const SizedBox.shrink();
                      } else {
                        return Column(
                          children: [
                            const PopularCourses(),
                            const UpcomingHomeEvents(),
                            SizedBox(height: context.screenHeight * 0.05),
                          ],
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
