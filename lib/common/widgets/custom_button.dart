import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonName;

  const CustomButton({
    super.key,
    this.onTap,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current theme's color scheme
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      //  height: 35,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          //side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          backgroundColor: colorScheme.surface,
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 13,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
