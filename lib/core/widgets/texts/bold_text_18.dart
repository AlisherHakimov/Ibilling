import 'package:flutter/cupertino.dart';

class BoldText18 extends StatelessWidget {
  BoldText18(this.text, {this.color, this.letterSpacing, super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}
