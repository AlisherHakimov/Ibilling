import 'package:flutter/cupertino.dart';

class BoldText14 extends StatelessWidget {
  BoldText14(this.text,
      {this.color, this.fontFamily, this.letterSpacing, super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: color,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing),
    );
  }
}
