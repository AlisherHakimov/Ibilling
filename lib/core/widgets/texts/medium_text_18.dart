import 'package:flutter/cupertino.dart';

class MediumText18 extends StatelessWidget {
  MediumText18(this.text,
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
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
