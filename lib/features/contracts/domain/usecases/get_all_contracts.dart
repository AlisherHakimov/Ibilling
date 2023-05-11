// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:ibilling/core/error/failures.dart';
import 'package:ibilling/features/contracts/domain/entities/contract.dart';
import 'package:ibilling/features/contracts/domain/repositories/contracts_repozitory.dart';

class GetAllContractsUseCase {
  final ContractsRepository contractRepository;

  GetAllContractsUseCase(
    this.contractRepository,
  );

  Future<Either<Failure, List<ContractEntity>>> call() async {
    return await contractRepository.getAllContracts();
  }
}
