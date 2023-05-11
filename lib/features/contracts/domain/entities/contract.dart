import 'package:equatable/equatable.dart';

class ContractEntity extends Equatable {
  final int id;
  final String fullName;
  final int amount;
  final int lastInvoice;
  final String type;
  final String status;
  final String dateTime;
  const ContractEntity({
    required this.id,
    required this.fullName,
    required this.amount,
    required this.lastInvoice,
    required this.type,
    required this.status,
    required this.dateTime,
  });

  @override
  List<Object> get props =>
      [id, fullName, amount, lastInvoice, type, status, dateTime];
}
