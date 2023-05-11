import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';

import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/texts/bold_text_14.dart';

class LeaveCommentDialog extends StatefulWidget {
  const LeaveCommentDialog({super.key});

  @override
  State<LeaveCommentDialog> createState() => _LeaveCommentDialogState();
}

class _LeaveCommentDialogState extends State<LeaveCommentDialog> {
  final TextEditingController _controller = TextEditingController();
  bool fieldIsNotEmpty = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          BoldText14(
            'Leave a comment, why are you',
          ),
          BoldText14(
            'deleting this contract?',
          ),
        ],
      ),
      titlePadding: const EdgeInsets.only(top: 16),
      backgroundColor: dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              autofocus: false,
              maxLines: null,
              onChanged: ((value) {
                fieldIsNotEmpty = value.isNotEmpty;
                setState(() {});
              }),
              decoration: InputDecoration(
                hintText: 'Type a comment',
                hintStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: color5C5C5C,
              ),
            ),
            _controller.text.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 28, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            title: 'Cancel',
                            verticalPadding: 12,
                            backgroundColor: red.withOpacity(0.3),
                            titleColor: red,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: PrimaryButton(
                            title: 'Done',
                            verticalPadding: 12,
                            backgroundColor: red,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
