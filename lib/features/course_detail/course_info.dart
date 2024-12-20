// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yoga_client_app/data/yoga_class.dart';
import 'package:yoga_client_app/utils/string_utils.dart';

import '../../common/widgets/custom_button.dart';
import '../../config/constants/text_styles.dart';
import '../home/info_item.dart';
import 'course_detail_screen.dart';

class CourseInfo extends StatelessWidget {
  final YogaClass yogaClass;

  const CourseInfo({
    super.key,
    required this.yogaClass,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // surfaceTintColor: ColorConst.lightAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              yogaClass.typeOfClass?.replaceAll("_", " ").capitalize() ?? "",
              style: TextStyles.cardTitle,
            ),
            const SizedBox(height: 12),
            UpperRowItemInfo(
              yogaClass: yogaClass,
            ),
            const SizedBox(height: 10),
            LowerRowItemInfo(yogaClass: yogaClass),
            const SizedBox(height: 10),
            //Divider(),
            CustomButton(
              buttonName: 'View',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    yogaClass: yogaClass,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
