import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/bold_text_14.dart';

class CustomDayBuilder extends StatelessWidget {
  const CustomDayBuilder({
    Key? key,
    required this.context,
    required this.day,
    required this.week,
  }) : super(key: key);

  final BuildContext context;
  final DateTime day;
  final DateTime week;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          BoldText14(
            DateFormat('EEE').format(day).substring(0, 2),
            color: colorD1D1D1,
          ),
          const SizedBox(height: 7),
          BoldText14('${day.day}', color: colorD1D1D1),
          const SizedBox(height: 4),
          Container(
            height: 1,
            width: 12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: colorE5E2EB),
          )
        ],
      ),
    );
  }
}
