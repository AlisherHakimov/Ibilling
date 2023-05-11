import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/medium_text_20.dart';

// ignore: must_be_immutable
class FilterAppBar extends StatelessWidget implements PreferredSizeWidget {
  FilterAppBar({this.color, required this.onExitPressed, super.key});

  Color? color;
  Function() onExitPressed;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(top: 22, left: 8, right: 20),
      color: darkest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onExitPressed,
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          MediumText20('Filter'),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 50);
}
