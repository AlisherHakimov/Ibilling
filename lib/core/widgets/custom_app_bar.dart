import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/config/colors.dart';

import 'texts/medium_text_18.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar(
      {this.color,
      required this.title,
      this.onFilterTap,
      this.onSearchTap,
      super.key});
  String title;
  Color? color;

  Function()? onFilterTap;
  Function()? onSearchTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(0, 50);
}

class _CustomAppBarState extends State<CustomAppBar> {
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
                widget.title.tr(),
                color: white,
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: widget.onFilterTap,
                child: SvgPicture.asset(
                  'assets/icons/bold/Filter.svg',
                  color: white,
                ),
              ),
              Container(
                height: 18,
                width: 1,
                color: white,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
              GestureDetector(
                onTap: widget.onSearchTap,
                child: SvgPicture.asset(
                  'assets/icons/light_outlined/Search.svg',
                  color: white,
                  width: 24,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
