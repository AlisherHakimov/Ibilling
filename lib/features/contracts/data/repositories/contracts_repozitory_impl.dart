// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:ibilling/core/error/failures.dart';
import 'package:ibilling/features/contracts/domain/entities/contract.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/contracts_repozitory.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';

class ContractsRepozitoryImpl implements ContractsRepository {
  final ContractsRemoteDataSource remoteDataSource;
  final ContractsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ContractsRepozitoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ContractEntity>>> getAllContracts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteContracts = await remoteDataSource.getAllContracts();
        localDataSource.contractsToCache(remoteContracts);
        return Right(remoteContracts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localContracts =
            await localDataSource.getLastContractsFromCache();
        return Right(localContracts);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
