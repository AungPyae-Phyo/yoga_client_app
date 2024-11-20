// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yoga_client_app/data/cart_manager.dart';
import '../../common/widgets/custom_button.dart';
import '../../data/yoga_class.dart';
import '../../config/constants/colors.dart';
import '../../config/constants/text_styles.dart';
import 'class_detail_screen.dart';

class ClassInfo extends StatefulWidget {
  final Course course;
  final bool isSaved;

  const ClassInfo({super.key, required this.course, required this.isSaved});

  @override
  State<ClassInfo> createState() => _ClassInfoState();
}

class _ClassInfoState extends State<ClassInfo> {
  late bool isAddedToCart;

  @override
  void initState() {
    super.initState();
    // Initialize the state based on the initial value
    isAddedToCart = widget.isSaved;
  }

  void handleAddToCart() {
    CartManager.addCourse(widget.course);
    setState(() {
      isAddedToCart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.fitness_center,
                    color: ColorConst.lightAccent,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.teacherNames?.join(", ") ?? "",
                        style: TextStyles.cardTitle,
                      ),
                      Text(
                        'Open Date: ${widget.course.date ?? ""}',
                        style: TextStyles.cardTitle,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    buttonName: isAddedToCart ? 'ADDED' : 'ADD TO CART',
                    onTap: isAddedToCart ? null : handleAddToCart,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(11),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewClassScreen(
                            course: widget.course,
                          ),
                        ),
                      );
                    },
                    child: const Text('VIEW CLASS'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
