import 'package:flutter/cupertino.dart';

class MediumText20 extends StatelessWidget {
  MediumText20(this.text,
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
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
