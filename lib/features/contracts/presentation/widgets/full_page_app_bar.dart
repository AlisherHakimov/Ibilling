import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/medium_text_18.dart';

// ignore: must_be_immutable
class ContractAppBar extends StatelessWidget implements PreferredSizeWidget {
  ContractAppBar({this.color, required this.title, super.key});
  String title;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: darkest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/contract_paper.png',
                fit: BoxFit.cover,
                height: 24,
              ),
              const SizedBox(width: 12),
              MediumText18(
                title,
                color: white,
              )
            ],
          ),
          SvgPicture.asset('assets/icons/bold/Bookmark.svg'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 50);
}
