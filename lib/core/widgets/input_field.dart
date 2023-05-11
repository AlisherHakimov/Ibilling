import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';

class InputField extends StatefulWidget {
  InputField({required this.controller, this.suffixIcon, super.key});
  TextEditingController controller;
  Widget? suffixIcon;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: ((value) {
        setState(() {});
      }),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1.2, color: white),
        ),
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.2,
            color:
                widget.controller.text.trim().isNotEmpty ? white : color606060,
          ),
        ),
      ),
    );
  }
}
