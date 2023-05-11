import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/medium_text_15.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {required this.title,
      required this.onPressed,
      this.titleColor,
      this.backgroundColor,
      this.verticalPadding,
      super.key});
  Function() onPressed;
  String title;
  Color? backgroundColor;
  Color? titleColor;
  double? horizontalPadding;
  double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 8,
        ),
        child: MediumText15(
          title,
          color: titleColor ?? white,
        ),
      ),
    );
  }
}
