import 'package:flutter/cupertino.dart';

class SemiboldText14 extends StatelessWidget {
  SemiboldText14(this.text,
      {this.color, this.fontFamily, this.maxLines, super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  String? fontFamily;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
