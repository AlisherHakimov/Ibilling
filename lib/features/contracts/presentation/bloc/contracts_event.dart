// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contracts_bloc.dart';

abstract class ContractsEvent extends Equatable {
  const ContractsEvent();

  @override
  List<Object> get props => [];
}

class ContractsInitial extends ContractsEvent {}

class LoadContractsEvent extends ContractsEvent {}

class ContractsFilterTapEvent extends ContractsEvent {}

class ContractsSearchTapEvent extends ContractsEvent {}

class FilterOrSearchExitEvent extends ContractsEvent {}

class ApplyFilterEvent extends ContractsEvent {
  List<String> selectedStatuses;
  DateTime fromDate;
  DateTime toDate;
  ApplyFilterEvent({
    required this.selectedStatuses,
    required this.fromDate,
    required this.toDate,
  });
  @override
  List<Object> get props => [fromDate, toDate, selectedStatuses];
}

class SelectDateTimeEvent extends ContractsEvent {
  DateTime dateTime;
  SelectDateTimeEvent({
    required this.dateTime,
  });
  @override
  List<Object> get props => [dateTime];
}
