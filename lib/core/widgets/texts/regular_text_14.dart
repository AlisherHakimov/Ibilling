import 'package:flutter/cupertino.dart';

class RegularText14 extends StatelessWidget {
  RegularText14(this.text,
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
