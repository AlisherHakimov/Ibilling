part of 'new_bloc.dart';

abstract class NewState extends Equatable {
  const NewState();

  @override
  List<Object> get props => [];
}

class NewInitialState extends NewState {}

class NewContractState extends NewState {}

class NewInvoiceState extends NewState {}
