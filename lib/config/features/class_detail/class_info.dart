// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../common/level/difficulity.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../data/yoga_class.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import 'view_class_screen.dart';

class ClassInfo extends StatelessWidget {
  final Course course;

  const ClassInfo({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.fitness_center,
                    color: ColorConst.lightAccent,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        course.teacherNames?.join(", ") ?? "",
                        style: TextStyles.cardTitle,
                      ),

                      Text(
                        
                        'Open Date: ${course.date ?? ""}',
                        style: TextStyles.cardTitle,
                      ),

                      //DifficulityLevel(level: DifficultyLevel.beginner),
                    ],
                  ),
                  const Spacer(),
                  // IconButton(
                  //     onPressed: () {}, icon: Icon(Icons.favorite_outline))
                ],
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                CustomButton(buttonName: 'ADD TO CART'),
                TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(11))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewClassScreen(
                          course: course,
                        ),
                      ),
                    );
                  },
                  child: const Text('VIEW CLASS'),
                  //style: TextStyles.label,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
