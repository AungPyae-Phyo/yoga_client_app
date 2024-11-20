// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yoga_client_app/config/constants/text_styles.dart';

import 'package:yoga_client_app/config/features/course_detail/course_info.dart';

import '../../../data/yoga_class.dart';
import '../class_detail/class_info.dart';

class CourseDetailScreen extends StatefulWidget {
  final YogaClass yogaClass;
  const CourseDetailScreen({
    Key? key,
    required this.yogaClass,
  }) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List<YogaClass> list = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final textTheme = currentTheme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Classes',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // UpperRowItemInfo(),
            const Text(
              'Description: ',
            ),
            const Text('Online URL: https://www.yoga.com/'),
            const SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Level: ${widget.yogaClass.difficultyLevel ?? ""}',
                style: TextStyles.bodyText,
              ),
            ),
            const SizedBox(height: 10),

            //Adding the ListView.builder within the SingleChildScrollView
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : widget.yogaClass.classes == null
                    ? Center(
                        child: Text("No Classes Available"),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: widget.yogaClass.classes!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data = widget.yogaClass.classes![index];
                            return ClassInfo(
                              course: data,
                            );
                          },
                        ),
                      ),
            const SizedBox(height: 20),

            // Bottom button
            // const CustomFillButton(text: 'Add to Cart'),
          ],
        ),
      ),
    );
  }
}
