// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yoga_client_app/config/constants/text_styles.dart';

import 'package:yoga_client_app/features/course_detail/course_info.dart';

import '../../data/cart_manager.dart';
import '../../data/yoga_class.dart';
import '../class_detail/class_info.dart';

class CourseDetailScreen extends StatefulWidget {
  final YogaClass yogaClass;
  const CourseDetailScreen({
    super.key,
    required this.yogaClass,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List<YogaClass> list = [];
  List<Course> courses = [];

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllItemsFromCart();
  }
@override
Widget build(BuildContext context) {
  final currentTheme = Theme.of(context);
  final textTheme = currentTheme.textTheme;

  // Check if `widget.yogaClass` is null or lacks data
  if (widget.yogaClass == null ||
      (widget.yogaClass.classes?.isEmpty ?? true)) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Name'),
      ),
      body: const Center(
        child: Text(
          "No Data Available",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

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
          const Text(
            'Description: ',
          ),
          const Text('Online URL: https://www.yoga.com/'),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Level: ${widget.yogaClass.difficultyLevel ?? ""}',
              style: TextStyles.bodyText,
            ),
          ),
          const SizedBox(height: 10),

          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: widget.yogaClass.classes!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = widget.yogaClass.classes![index];
                      final isSaved = courses.contains(data);
                      return ClassInfo(
                        isSaved: isSaved,
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


  void getAllItemsFromCart() {
    setState(() {
      courses = CartManager.getAllCourse();
    });
  }
}
