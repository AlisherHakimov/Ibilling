import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/regular_text_14.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 6),
        child: RegularText14(
          title,
          color: color606060,
        ),
      );
}
