import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/medium_text_18.dart';

// ignore: must_be_immutable
class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({this.color, required this.title, super.key});
  String title;
  Color? color;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, 50);
}

class _MainAppBarState extends State<MainAppBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: widget.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              MediumText18(
                widget.title,
                color: white,
              )
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
