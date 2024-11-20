import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyText = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: ColorConst.darkAccent);

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle noticeText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textSpan = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: ColorConst.darkAccent,
    color: ColorConst.darkAccent,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: ColorConst.errorColor,
  );
}
