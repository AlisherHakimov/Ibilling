import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/medium_text_14.dart';
import 'package:ibilling/core/widgets/main_app_bar.dart';
import 'package:ibilling/features/profile/presentation/widgets/change_language_dialog.dart';
import 'package:ibilling/features/profile/presentation/widgets/country_flag.dart';
import 'package:ibilling/features/profile/presentation/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = context.locale;
    String languageName = currentLocale.languageCode == 'en'
        ? 'English (US)'
        : currentLocale.languageCode == 'ru'
            ? 'Русский'
            : 'O\'zbek (Lotin)';
    return Scaffold(
      appBar: MainAppBar(
        title: 'Profile'.tr(),
        color: darkest,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const ProfileCard(),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => ChangeLanguageDialog(context.locale),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: dark,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumText14(
                      languageName,
                      color: colorE7E7E7,
                    ),
                    CountryFlag(countryCode: currentLocale.languageCode),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
