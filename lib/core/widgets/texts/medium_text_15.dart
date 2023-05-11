import 'package:flutter/cupertino.dart';

class MediumText15 extends StatelessWidget {
  MediumText15(this.text,
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
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
