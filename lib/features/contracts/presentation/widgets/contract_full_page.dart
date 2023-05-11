import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/card_item.dart';
import 'package:ibilling/core/widgets/texts/bold_text_16.dart';
import 'package:ibilling/core/widgets/adress_item.dart';
import 'package:ibilling/features/contracts/presentation/widgets/leave_comment_dialog.dart';
import 'full_page_app_bar.dart';
import '../../../../core/widgets/primary_button.dart';

class ContractFullpage extends StatelessWidget {
  const ContractFullpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContractAppBar(
        title: '№  154',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CardItem('Fisher\' full name:', 'Yoldosheva Ziyoda'),
                    const SizedBox(height: 12),
                    CardItem('Status of the contract:', 'Paid'),
                    const SizedBox(height: 12),
                    CardItem('Amount:', '1,200,000'),
                    const SizedBox(height: 12),
                    CardItem('Last invoice:', '№  156'),
                    const SizedBox(height: 12),
                    CardItem('Number of invoices:', '6'),
                    const SizedBox(height: 12),
                    const AdressItem(
                        title: 'Address of the organization:',
                        value: 'Проспект Мирзо-Улугбека'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    title: 'Delete contract',
                    backgroundColor: red.withOpacity(0.2),
                    titleColor: red,
                    verticalPadding: 12,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const LeaveCommentDialog());
                    },
                  ),
                  PrimaryButton(
                    title: 'Create contract',
                    backgroundColor: darkGreen,
                    verticalPadding: 12,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 40),
              BoldText16('Other contracts with'),
              BoldText16('Yoldosheva Ziyoda'),
              ListView.builder(
                padding: const EdgeInsets.only(bottom: 17, top: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  color: red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
