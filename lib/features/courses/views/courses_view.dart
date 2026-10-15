import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/features/courses/models/course/course_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/view_model/course_view_model/course_view_model.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/heading_4.dart';
import 'package:skill_in_a_box_flutter/features/courses/widgets/layout_widget.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  TextEditingController searchController = TextEditingController();

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Fixed Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomTextField(
                prefixIcon: SvgPicture.asset(
                  Assets.icons.search,
                ),
                hintText: 'Search Courses',
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),

            /// Scrollable List of Courses by Category
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final courseData = ref.watch(courseStreamProvider);

                  return courseData.when(
                    data: (data) {
                      /// Filter courses based on search query
                      final filteredData = data
                          .where(
                            (course) => course.title!
                                .toLowerCase()
                                .contains(_searchQuery),
                          )
                          .toList();

                      /// Group courses by category
                      final categoryMap = <String, List<Course>>{};
                      for (final course in filteredData) {
                        final category = course.categoryDetails!.name;
                        if (!categoryMap.containsKey(category)) {
                          categoryMap[category!] = [];
                        }
                        categoryMap[category]!.add(course);
                      }

                      if (categoryMap.isEmpty) {
                        return const Center(
                          child: Text('No courses found'),
                        );
                      }

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...categoryMap.entries.map((entry) {
                                final categoryName = entry.key;
                                final courses = entry.value;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Category Heading
                                    const SizedBox(height: 16),
                                    Heading4(text: categoryName),
                                    const SizedBox(height: 16),

                                    /// Courses under this category
                                    LayoutWidget(courses: courses),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: orange.shade500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
