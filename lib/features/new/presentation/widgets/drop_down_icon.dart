import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';

class DropDownIcon extends StatelessWidget {
  const DropDownIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: color606060,
      ),
      child: const Icon(
        Icons.arrow_drop_down,
        color: black,
      ),
    );
  }
}
