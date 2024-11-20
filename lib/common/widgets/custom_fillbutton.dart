import 'package:flutter/material.dart';

class CustomFillButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const CustomFillButton({super.key, required this.text, this.onTap});

  @override
  State<CustomFillButton> createState() => _CustomFillButtonState();
}

class _CustomFillButtonState extends State<CustomFillButton> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.06, vertical: deviceWidth * 0.1),
      child: SizedBox(
        height: deviceWidth / 7.5,
        child: FilledButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12.0), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: () {
              widget.onTap;
            },
            child: Text(widget.text)),
      ),
    );
  }
}
