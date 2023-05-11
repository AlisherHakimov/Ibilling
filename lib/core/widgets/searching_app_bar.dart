import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';

// ignore: must_be_immutable
class SearchingAppBar extends StatefulWidget implements PreferredSizeWidget {
  SearchingAppBar(
      {this.color,
      this.onExitPressed,
      required this.controller,
      required this.onChanged,
      super.key});
  Color? color;
  Function()? onExitPressed;
  Function()? onChanged;
  TextEditingController controller;

  @override
  Size get preferredSize => const Size(0, 50);

  @override
  State<SearchingAppBar> createState() => _SearchingAppBarState();
}

class _SearchingAppBarState extends State<SearchingAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(top: 22, left: 8, right: 12),
      color: widget.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: widget.onExitPressed,
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: TextField(
              onChanged: ((value) {
                widget.onChanged;
              }),
              controller: widget.controller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by keywords',
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            ),
          ),
          IconButton(
            onPressed: (() {
              widget.controller.text = '';
            }),
            splashRadius: 20,
            icon: const Icon(
              Icons.close,
            ),
          )
        ],
      ),
    );
  }
}
