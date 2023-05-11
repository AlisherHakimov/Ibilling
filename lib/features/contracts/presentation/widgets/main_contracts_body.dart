import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/contract_card.dart';
import 'package:ibilling/core/widgets/empty_contracts_widget.dart';
import 'package:ibilling/core/widgets/primary_button.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/features/contracts/presentation/widgets/select_calendar_date.dart';

class MainContractsBody extends StatefulWidget {
  const MainContractsBody({super.key});

  @override
  State<MainContractsBody> createState() => _MainContractsBodyState();
}

class _MainContractsBodyState extends State<MainContractsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsBloc, ContractsState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            const LoadedContractsWidget(),
            const SelectCalendarDate(),
            if (state is SearchContractsState)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: black.withOpacity(0.9),
              ),
          ],
        );
      },
    );
  }
}

class LoadedContractsWidget extends StatelessWidget {
  const LoadedContractsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsBloc, ContractsState>(
      builder: (context, state) {
        if (state is LoadedContractsState) {
          if (state.contracts.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 190,
                      left: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PrimaryButton(
                          title: 'Contracts',
                          onPressed: (() {}),
                          backgroundColor: lightGreen,
                        ),
                        const SizedBox(width: 16),
                        PrimaryButton(
                          title: 'Invoice',
                          backgroundColor: transparent,
                          onPressed: (() {}),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.contracts.length,
                    itemBuilder: (context, index) => ContractCard(
                      contract: state.contracts[index],
                      invoiceNumber: state.contracts.length,
                    ),
                  ),
                  if (state.contracts.length > 10)
                    PrimaryButton(
                      title: 'Load more',
                      backgroundColor: lightGreen,
                      onPressed: (() {}),
                    )
                ],
              ),
            );
          } else {
            return const EmptyContractsWidget();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
