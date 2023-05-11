import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/date_picker_card.dart';
import 'package:ibilling/core/widgets/texts/bold_text_14.dart';
import 'package:ibilling/core/widgets/custom_app_bar.dart';
import 'package:ibilling/core/widgets/filter_app_bar.dart';
import 'package:ibilling/core/widgets/searching_app_bar.dart';
import 'package:ibilling/features/history/presentation/bloc/history_bloc.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  DateTime? fromDate;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: (state is HistoryInitialState)
              ? CustomAppBar(
                  title: 'History',
                  onFilterTap: () =>
                      context.read<HistoryBloc>().add(HistoryFilterTap()),
                  onSearchTap: () =>
                      context.read<HistoryBloc>().add(HistorySearchTap()),
                )
              : (state is HistorySearchState)
                  ? SearchingAppBar(
                      onChanged: () {},
                      controller: _controller,
                      onExitPressed: () =>
                          context.read<HistoryBloc>().add(HistoryInitial()),
                    )
                  : FilterAppBar(
                      onExitPressed: () =>
                          context.read<HistoryBloc>().add(HistoryInitial()),
                    ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText14(
                        'Date',
                        color: colorD1D1D1,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectData(context);
                            },
                            child: DatePickerCard(
                              dateTime: DateTime(2022, 01, 02),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            width: 8,
                            height: 2,
                            color: colorD1D1D1,
                          ),
                          DatePickerCard(
                            dateTime: DateTime(2022, 1, 2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ListView.builder(
                //   padding:
                //       EdgeInsets.only(left: 16, right: 16, bottom: 76),
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: 8,
                //   itemBuilder: (context, index) =>  ContractCard(),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<DateTime?> _selectData(BuildContext context) async {
    DateTime? dateTime;
    showDatePicker(
      context: context,
      initialDate: DateTime(2023),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    ).then((value) {
      dateTime = value;
    });
    return dateTime;
  }
}
