import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_calendar_and_datepicker/horizontal_calendar_and_datepicker.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/bold_text_14.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/features/contracts/presentation/widgets/custom_day_builder.dart';

class SelectCalendarDate extends StatefulWidget {
  const SelectCalendarDate({super.key});

  @override
  State<SelectCalendarDate> createState() => _SelectCalendarDateState();
}

class _SelectCalendarDateState extends State<SelectCalendarDate> {
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      color: darker,
      alignment: Alignment.bottomCenter,
      constraints: BoxConstraints.loose(const Size(double.maxFinite, 150)),
      child: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarFormat: CalendarFormat.week,
        sixWeekMonthsEnforced: true,
        headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(
            color: colorDADADA,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        LeftIcon: const Image(
          image: AssetImage('assets/icons/bold/left_chevron.png'),
          height: 24,
          fit: BoxFit.cover,
        ),
        RightIcon: const Image(
          image: AssetImage('assets/icons/bold/right_chevron.png'),
          height: 24,
          fit: BoxFit.cover,
        ),
        focusedDay: _focusedDay,
        firstDay: DateTime(2020, 2, 3),
        lastDay: DateTime(2024, 3, 3),
        leftchevronsize: 24,
        rightchevronsize: 24,
        selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
        onDaySelected: (selectedDay, focusedDay) {
          _focusedDay = selectedDay;
          context
              .read<ContractsBloc>()
              .add(SelectDateTimeEvent(dateTime: _focusedDay));
          setState(() {});
        },
        rowHeight: 72,
        daysOfWeekHeight: 0,
        calendarBuilders: CalendarBuilders(
          outsideBuilder: ((context, day, focusedDay) =>
              CustomDayBuilder(context: context, day: day, week: focusedDay)),
          dowBuilder: ((context, day) => Container(height: 20)),
          todayBuilder: ((context, day, focusedDay) =>
              CustomDayBuilder(context: context, day: day, week: focusedDay)),
          defaultBuilder: ((context, day, focusedDay) =>
              CustomDayBuilder(context: context, day: day, week: focusedDay)),
          selectedBuilder: (context, day, focusedDay) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: lightGreen, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  BoldText14(DateFormat('EEE').format(day).substring(0, 2)),
                  const SizedBox(height: 7),
                  BoldText14('${day.day}'),
                  const SizedBox(height: 4),
                  Container(
                    height: 1,
                    width: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: white),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
