import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/enums/payment_status.dart';
import 'package:ibilling/core/utils/status_to_string.dart';
import 'package:ibilling/core/widgets/date_picker_card.dart';
import 'package:ibilling/core/widgets/texts/bold_text_14.dart';
import 'package:ibilling/core/widgets/texts/medium_text_14.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/core/widgets/primary_button.dart';

class FilterContractsBody extends StatefulWidget {
  FilterContractsBody({required this.onCancelPressed, super.key});
  Function() onCancelPressed;
  @override
  State<FilterContractsBody> createState() => _FilterContractsBodyState();
}

class _FilterContractsBodyState extends State<FilterContractsBody> {
  final List<String> _selectedStatuses = [];
  DateTime _fromDate = DateTime(2020, 02, 02);
  DateTime _toDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 28, bottom: 84),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText14(
                'Status',
                color: primaryText,
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      statusItem(PaymentStatus.paid),
                      const SizedBox(height: 24),
                      statusItem(PaymentStatus.inProcess),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      statusItem(PaymentStatus.rejectedByIQ),
                      const SizedBox(height: 24),
                      statusItem(PaymentStatus.rejectedByPayme),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 32),
              BoldText14(
                'Date',
                color: primaryText,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: (() async {
                      _selectDate(context, _fromDate).then(
                        (value) {
                          _fromDate = value;
                          setState(() {});
                        },
                      );
                    }),
                    child: DatePickerCard(
                      dateTime: _fromDate,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: 8,
                    height: 2,
                    color: colorD1D1D1,
                  ),
                  GestureDetector(
                    onTap: (() {
                      _selectDate(context, _toDate).then((value) {
                        _toDate = value;
                        setState(() {});
                      });
                    }),
                    child: DatePickerCard(
                      dateTime: _toDate,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PrimaryButton(
                  title: 'Cancel',
                  backgroundColor: darkGreen.withOpacity(0.3),
                  titleColor: darkGreen,
                  onPressed: widget.onCancelPressed,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  title: 'Apply filters',
                  backgroundColor: darkGreen,
                  onPressed: (() {
                    context.read<ContractsBloc>().add(
                          ApplyFilterEvent(
                            fromDate: _fromDate,
                            toDate: _toDate,
                            selectedStatuses: _selectedStatuses,
                          ),
                        );
                  }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget statusItem(PaymentStatus status) {
    String statusString = statusToString(status);
    return Row(
      children: [
        GestureDetector(
          onTap: (() {
            if (_selectedStatuses.contains(statusString)) {
              _selectedStatuses.remove(statusString);
            } else {
              _selectedStatuses.add(statusString);
            }
            setState(() {});
          }),
          child: SvgPicture.asset(
            'assets/images/${_selectedStatuses.contains(statusString) ? 'checked' : 'not_checked'}.svg',
          ),
        ),
        const SizedBox(width: 10),
        MediumText14(
          statusToString(status),
          color: _selectedStatuses.contains(statusString)
              ? activeIcon
              : colorCDCDCD,
        )
      ],
    );
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime initialDate) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    return newSelectedDate ?? initialDate;
  }
}
