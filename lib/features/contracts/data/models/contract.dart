import 'package:json_annotation/json_annotation.dart';

import 'package:ibilling/features/contracts/domain/entities/contract.dart';

part 'contract.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ContractModel extends ContractEntity {
  const ContractModel({
    required super.id,
    required super.fullName,
    required super.amount,
    required super.lastInvoice,
    required super.type,
    required super.status,
    required super.dateTime,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractModelToJson(this);
}
