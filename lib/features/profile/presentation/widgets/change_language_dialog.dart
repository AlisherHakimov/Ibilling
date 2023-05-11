import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/primary_button.dart';
import 'package:ibilling/features/profile/presentation/bloc/profile_bloc.dart';
import 'country_flag.dart';
import '../../../../core/widgets/texts/bold_text_16.dart';

class ChangeLanguageDialog extends StatefulWidget {
  ChangeLanguageDialog(this.currentLocale, {super.key});
  Locale currentLocale;
  @override
  State<ChangeLanguageDialog> createState() => _ChangeLanguageDialogState();
}

class _ChangeLanguageDialogState extends State<ChangeLanguageDialog> {
  late Locale selectedLocale = widget.currentLocale;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.symmetric(vertical: 16),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Center(
        child: BoldText16(
          'Choose a language',
          color: white,
        ),
      ),
      actions: [
        languageTile(context, 'O`zbek (Lotin)', 'uz'),
        languageTile(context, 'Русский', 'ru'),
        languageTile(context, 'English', 'en'),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 28, left: 28, right: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PrimaryButton(
                  title: 'Cancel',
                  titleColor: darkGreen,
                  backgroundColor: darkGreen.withOpacity(0.5),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: PrimaryButton(
                  title: 'Done',
                  backgroundColor: darkGreen,
                  onPressed: () {
                    context.setLocale(selectedLocale);
                    Navigator.pop(context);
                    context
                        .read<ProfileBloc>()
                        .add(SelectLanguageEvent(locale: selectedLocale));
                  },
                ),
              ),
            ],
          ),
        )
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: dark,
    );
  }

  Widget languageTile(
    BuildContext context,
    String title,
    String languageCode,
  ) {
    return InkWell(
      onTap: () {
        selectedLocale = Locale(languageCode);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CountryFlag(countryCode: languageCode),
                const SizedBox(width: 12),
                Text(title),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/bold/Radio.svg',
              color: selectedLocale.languageCode == languageCode
                  ? darkGreen
                  : colorDADADA,
            ),
          ],
        ),
      ),
    );
  }
}
