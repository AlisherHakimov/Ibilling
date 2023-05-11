import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/bold_text_16.dart';
import 'package:ibilling/core/widgets/texts/medium_text12.dart';
import '../../../../core/widgets/card_item.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration:
          BoxDecoration(color: dark, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/Profile.png',
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText16(
                        'Otabek Abdusamadov',
                        color: lightGreen,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      MediumText12(
                        'Graphic designer • IQ Education',
                        color: colorE7E7E7,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          CardItem('Date of birth', '16.09.2001'),
          const SizedBox(height: 12),
          CardItem('Phone number', '+998 97 721 06 68'),
          const SizedBox(height: 12),
          CardItem('E-mail:', 'predatorhunter041@gmail.com'),
        ],
      ),
    );
  }
}
