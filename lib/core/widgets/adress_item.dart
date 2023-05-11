import 'package:flutter/widgets.dart';
import 'package:ibilling/config/colors.dart';

class AdressItem extends StatelessWidget {
  const AdressItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => RichText(
        maxLines: 3,
        text: TextSpan(
          text: title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: colorE7E7E7,
          ),
          children: [
            TextSpan(
              text: '  $value',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryText,
              ),
            )
          ],
        ),
      );
}
