import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/contract.dart';

abstract class ContractsRepository {
  Future<Either<Failure, List<ContractEntity>>> getAllContracts();
}
