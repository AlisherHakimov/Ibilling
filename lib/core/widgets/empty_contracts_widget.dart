import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/config/colors.dart';

class EmptyContractsWidget extends StatelessWidget {
  const EmptyContractsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/Document.svg',
          color: color333333,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
