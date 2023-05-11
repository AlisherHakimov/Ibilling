import 'package:flutter/cupertino.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/regular_text_14.dart';

class CardItem extends StatelessWidget {
  CardItem(this.title, this.value, {super.key});
  String title;
  String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RegularText14(
          title,
          color: colorE7E7E7,
        ),
        const SizedBox(width: 8),
        RegularText14(
          value,
          maxLines: 3,
          color: primaryText,
        ),
      ],
    );
  }
}
