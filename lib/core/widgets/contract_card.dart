import 'package:flutter/material.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/features/contracts/domain/entities/contract.dart';
import '../../features/contracts/presentation/widgets/contract_full_page.dart';
import 'texts/bold_text_14.dart';
import 'card_item.dart';
import 'texts/medium_text12.dart';

class ContractCard extends StatelessWidget {
  ContractCard(
      {required this.contract, required this.invoiceNumber, super.key});
  ContractEntity contract;
  int invoiceNumber;

  @override
  Widget build(BuildContext context) {
    Color statusColor = contract.status == 'Paid'
        ? color49B7A5
        : contract.status == 'In process'
            ? colorFDAB2A
            : colorFF426D;
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ContractFullpage(),
          ),
        );
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.only(top: 12),
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
                      'assets/images/contract_paper.png',
                    ),
                    BoldText14(
                      '  №  ${contract.id}',
                      color: colorE7E7E7,
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8)),
                  child: MediumText12(
                    contract.status,
                    color: statusColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            CardItem('Fish:', contract.fullName),
            const SizedBox(height: 6),
            CardItem('Amount', contract.amount.toString()),
            const SizedBox(height: 6),
            CardItem('Last invoice:', contract.lastInvoice.toString()),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardItem('Number of invoices:', invoiceNumber.toString()),
                BoldText14(
                  contract.dateTime,
                  color: primaryText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
