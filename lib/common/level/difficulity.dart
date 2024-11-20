import 'package:flutter/material.dart';

import '../../config/constants/text_styles.dart';

enum DifficultyLevel {
  beginner,
  intermediate,
  advanced,
}

extension DifficultyLevelExtension on DifficultyLevel {
  String get label {
    switch (this) {
      case DifficultyLevel.beginner:
        return 'Beginner';
      case DifficultyLevel.intermediate:
        return 'Intermediate';
      case DifficultyLevel.advanced:
        return 'Advanced';
    }
  }
}

class DifficulityLevel extends StatelessWidget {
  final DifficultyLevel level;

  const DifficulityLevel({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final cardColor = theme.cardTheme.color;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        'Level: ${level.label}',
        style: TextStyles.noticeText.copyWith(color: textColor),
      ),
    );
  }
}
