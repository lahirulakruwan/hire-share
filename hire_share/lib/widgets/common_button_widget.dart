import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double borderRadius;
  final double width;
  final double height;
  final double fontSize;
  final Color? borderColor;
  final VoidCallback onPressed;

  const CommonButtonWidget({
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.fontSize,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            backgroundColor: backgroundColor,
            side: BorderSide(
              color: borderColor ?? Colors.grey.shade500,
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
