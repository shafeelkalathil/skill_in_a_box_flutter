import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course_overview/course_overview_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_state.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/bottom_sheet_with_price.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/curriculum_section.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/doubt_box_section.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/overview_section.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/video_player.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class CourseDetailsScreen extends ConsumerStatefulWidget {
  const CourseDetailsScreen({
    required this.courseId,
    required this.courseType,
    super.key,
  });
  final String courseId;
  final String courseType;

  @override
  ConsumerState<CourseDetailsScreen> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends ConsumerState<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  CourseOverviewModel? courseOverviewData;

  Future<void> _fetchCourseOverviewData() async {
    try {
      courseOverviewData = await ref
          .read(courseViewModelProvider.notifier)
          .fetchCourseOverview(courseId: widget.courseId);
    } catch (e) {
      debugPrint('Failed to fetch course overview: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
      length: widget.courseType == 'normal' ? 3 : 2,
      vsync: this,
    );
    Future.microtask(() async {
      await _fetchCourseOverviewData();
    });
    // _fetchCourseOverviewData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseViewModelProvider);
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Course Details'),
      body: courseState is CourseLoading
          ? Center(
              child: CircularProgressIndicator(
                color: orange.shade500,
              ),
            )
          : courseState is CourseFailure
              ? Center(child: Text(courseState.message))
              : courseState is CourseSuccess
                  ? Builder(
                      builder: (context) {
                        if (courseOverviewData == null) {
                          return Center(
                              child: Text(
                            'No Data to show',
                            style: subtitle1,
                          ),);
                        } else {
                          return NestedScrollView(
                            headerSliverBuilder: (context, value) {
                              final courseOverview = courseOverviewData;
                              return [
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.screenWidth * 0.06,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomMuxVideoPlayer(
                                          assetId: courseOverview!
                                                  .trailer?[0].link ??
                                              '',
                                        ),
                                        const SizedBox(height: 22),
                                        Text(
                                          courseOverview.title ?? '',
                                          style: heading3,
                                        ),
                                        const SizedBox(height: 24),
                                        Text(
                                          'This course includes',
                                          style: subtitle3.copyWith(
                                            color: dark
                                                ? const Color(0xffD3D3D3)
                                                : silverChalice.shade900,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.time,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 16),
                                            Flexible(
                                              child: Text(
                                                '${courseOverview.access} Access',
                                                style: subtitle3.copyWith(
                                                  color: dark
                                                      ? const Color(0xffD3D3D3)
                                                      : silverChalice.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.learn,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 16),
                                            Flexible(
                                              child: Text(
                                                '${courseOverview.lessons} Lessons',
                                                style: subtitle3.copyWith(
                                                  color: dark
                                                      ? const Color(0xffD3D3D3)
                                                      : silverChalice.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.language,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 16),
                                            Flexible(
                                              child: Text(
                                                'English, Hindi',
                                                style: subtitle3.copyWith(
                                                  color: dark
                                                      ? const Color(0xffD3D3D3)
                                                      : silverChalice.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.certificate,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 16),
                                            Flexible(
                                              child: Text(
                                                'Certificate of completion',
                                                style: subtitle3.copyWith(
                                                  color: dark
                                                      ? const Color(0xffD3D3D3)
                                                      : silverChalice.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                      ],
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      TabBar(
                                        controller: _tabController,
                                        indicatorSize:
                                            TabBarIndicatorSize.label,
                                        padding: EdgeInsets.only(
                                          right: widget.courseType == 'normal'
                                              ? context.screenWidth * 0.26
                                              : context.screenWidth * 0.47,
                                        ),
                                        isScrollable: true,
                                        tabAlignment: TabAlignment.start,
                                        tabs: [
                                          const Tab(text: 'Overview'),
                                          const Tab(text: 'Curriculum'),
                                          if (widget.courseType == 'normal')
                                            const Tab(text: 'Doubt box'),
                                        ],
                                      ),
                                      Divider(
                                        height: 1,
                                        color: dark
                                            ? const Color(0xff222223)
                                            : silverChalice.shade100,
                                      ),
                                      const SizedBox(height: 32),
                                    ],
                                  ),
                                ),
                              ];
                            },
                            body: TabBarView(
                              controller: _tabController,
                              children: [
                                OverviewSection(
                                  courseOverviewData: courseOverviewData!,
                                ),
                                CurriculumSection(
                                  courseId: widget.courseId,
                                ),
                                if (widget.courseType == 'normal')
                                  DoubtBoxSection(
                                    courseId: widget.courseId,
                                  ),
                              ],
                            ),
                          );
                        }
                      },
                    )
                  : const SizedBox.shrink(),
      bottomSheet: courseState is CourseSuccess
          ? BottomSheetWithPrice(
              finalPrice:
                  '₹${(courseOverviewData?.courseFee ?? 0) - (courseOverviewData?.discount ?? 0)}',
              originalPrice: '₹${courseOverviewData?.courseFee ?? 0}',
              registrationPrice:
                  '₹${courseOverviewData?.registrationAmount ?? 0}',
            )
          : const SizedBox.shrink(),
    );
  }
}
