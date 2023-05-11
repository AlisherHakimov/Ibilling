// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contracts_bloc.dart';

abstract class ContractsState extends Equatable {
  const ContractsState();

  @override
  List<Object> get props => [];
}

class ContractsInitialState extends ContractsState {}

class LoadingContractsState extends ContractsState {}

class LoadedContractsState extends ContractsState {
  List<ContractEntity> contracts;

  LoadedContractsState({required this.contracts});
  @override
  List<Object> get props => [contracts];
}

class SearchContractsState extends ContractsState {}

class FilterContractsState extends ContractsState {}

class ErrorContractsState extends ContractsState {
  final String message;
  const ErrorContractsState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
