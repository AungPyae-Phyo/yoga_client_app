// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yoga_client_app/data/yoga_class.dart';

import '../../../../constants/colors.dart';

class UpperRowItemInfo extends StatelessWidget {
  final YogaClass yogaClass;
  const UpperRowItemInfo({
    Key? key,
    required this.yogaClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          color: ColorConst.darkAccent,
          size: 19,
        ),
        const SizedBox(width: 4),
        Text(yogaClass.dayOfWeek ?? ""),
        SizedBox(width: 10),
        Icon(
          Icons.timer_outlined,
          color: ColorConst.darkAccent,
          size: 19,
        ),
        const SizedBox(width: 4),
        Text(yogaClass.time ?? ""),
        SizedBox(width: 10),
        Icon(
          Icons.access_time,
          color: ColorConst.darkAccent,
          size: 19,
        ),
        SizedBox(width: 4),
        Text(yogaClass.duration ?? "")
      ],
    );
  }
}

class LowerRowItemInfo extends StatelessWidget {
  final YogaClass yogaClass;

  LowerRowItemInfo({
    Key? key,
    required this.yogaClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.gps_fixed_outlined,
          color: ColorConst.darkAccent,
          size: 19,
        ),
        SizedBox(width: 4),
        Text(yogaClass.eventType ?? ""),
        SizedBox(width: 10),
        Icon(
          Icons.people,
          color: ColorConst.darkAccent,
          size: 19,
        ),
        SizedBox(width: 4),
        Text(yogaClass.capacity?.toString() ?? ""),
        SizedBox(width: 10),
        Icon(
          Icons.euro_sharp,
          color: ColorConst.darkAccent,
          size: 19,
        ),
        SizedBox(width: 4),
        Text(yogaClass.displayPrice ?? "")
      ],
    );
  }
}
