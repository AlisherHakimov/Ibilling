import 'package:flutter/cupertino.dart';

class MediumText12 extends StatelessWidget {
  MediumText12(this.text,
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
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
