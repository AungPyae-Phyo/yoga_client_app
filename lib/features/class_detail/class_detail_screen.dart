import 'package:flutter/material.dart';

import '../../common/widgets/custom_button.dart';
import '../../data/yoga_class.dart';
import '../../config/constants/colors.dart';
import '../../config/constants/text_styles.dart';

class ViewClassScreen extends StatefulWidget {
  final Course course;

  const ViewClassScreen({super.key, required this.course});

  @override
  State<ViewClassScreen> createState() => _ViewClassScreenState();
}

class _ViewClassScreenState extends State<ViewClassScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final deviceWidth = MediaQuery.of(context).size.width;

    final textTheme = currentTheme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Details'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: deviceWidth,
            height: 200,
            decoration: const BoxDecoration(
              color: ColorConst.lightAccent,
            ),
            child: const Center(
              child: Text(
                'Flow Yoga',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Teacher Name: ',
                      style: TextStyles.cardTitle,
                    ),
                    Row(
                      children: widget.course.teacherNames?.map((name) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: ColorConst.darkAccent),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3, bottom: 3),
                                child: Text(
                                  name,
                                  style: TextStyles.cardTitle,
                                ),
                              ),
                            );
                          }).toList() ??
                          [const Text('No teachers available')],
                    ),
                  ],
                ),
                Text(
                  'Open Day: ${widget.course.dayOfWeek ?? ""}',
                  style: TextStyles.cardTitle,
                ),
                const SizedBox(height: 10),
                Text('Description: ${widget.course.comment}'),
                const SizedBox(height: 10),
                // Padding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: deviceWidth * 0.035),
                //   child: const CustomButton(
                //     buttonName: 'BOOK NOW',
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
