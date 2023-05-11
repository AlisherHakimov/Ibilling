import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/config/strings.dart';
import 'package:ibilling/core/widgets/texts/bold_text_16.dart';
import 'package:ibilling/core/widgets/texts/medium_text_16.dart';
import 'package:ibilling/features/new/presentation/bloc/new_bloc.dart';

class NewDialog extends StatelessWidget {
  const NewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: dark,
      titlePadding: const EdgeInsets.symmetric(vertical: 16),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
      title: Center(
        child: BoldText16(
          'Что вы хотите создатьт',
          color: white,
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: dark,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            createButton(context, CONTRACT),
            const SizedBox(height: 12),
            createButton(context, INVOICE),
          ],
        ),
      ),
    );
  }

  Widget createButton(
    BuildContext context,
    String type,
  ) {
    return InkWell(
      onTap: () {
        context.read<NewBloc>().add(SelectNewItemEvent(type: type));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
            color: color4E4E4E.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Image.asset(
              'assets/images/${type.toLowerCase()}_paper.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 16),
            MediumText16(type, color: colorE7E7E7),
          ],
        ),
      ),
    );
  }
}
