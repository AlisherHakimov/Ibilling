// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractModel _$ContractModelFromJson(Map<String, dynamic> json) =>
    ContractModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      amount: json['amount'] as int,
      lastInvoice: json['last_invoice'] as int,
      type: json['type'] as String,
      status: json['status'] as String,
      dateTime: json['date_time'] as String,
    );

Map<String, dynamic> _$ContractModelToJson(ContractModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'amount': instance.amount,
      'last_invoice': instance.lastInvoice,
      'type': instance.type,
      'status': instance.status,
      'date_time': instance.dateTime,
    };
