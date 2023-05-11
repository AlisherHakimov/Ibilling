import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/config/colors.dart';
import 'package:intl/intl.dart';
import 'texts/medium_text_14.dart';

class DatePickerCard extends StatelessWidget {
  DatePickerCard({
    required this.dateTime,
    Key? key,
  }) : super(key: key);
  DateTime? dateTime;

  final format = DateFormat('dd.MM.yyyy');

  dynamic dateTimeParse;

  @override
  Widget build(BuildContext context) {
    dateTimeParse = format.format(dateTime!);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: dark,
      ),
      child: Row(
        children: [
          MediumText14(
            dateTimeParse,
            color: primaryText,
          ),
          const SizedBox(width: 6),
          SvgPicture.asset(
            'assets/icons/bold/Calendar.svg',
            color: colorDADADA,
            height: 16,
          )
        ],
      ),
    );
  }
}
