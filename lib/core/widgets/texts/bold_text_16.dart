import 'package:flutter/cupertino.dart';

class BoldText16 extends StatelessWidget {
  BoldText16(this.text,
      {this.color, this.fontFamily, this.textAlign, super.key});
  String? text;
  Color? color;
  String? fontFamily;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
}
