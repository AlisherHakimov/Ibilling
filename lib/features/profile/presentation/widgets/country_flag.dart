import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/flag_$countryCode.png',
        fit: BoxFit.cover,
        height: 24,
      ),
    );
  }
}
