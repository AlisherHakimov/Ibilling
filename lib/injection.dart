import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ibilling/features/contracts/data/datasources/local_datasource.dart';
import 'package:ibilling/features/contracts/data/datasources/remote_datasource.dart';
import 'package:ibilling/features/contracts/data/repositories/contracts_repozitory_impl.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';

import 'features/contracts/domain/repositories/contracts_repozitory.dart';
import 'features/contracts/domain/usecases/get_all_contracts.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => ContractsBloc(getAllContracts: sl()),
  );
  sl.registerFactory(
    () => ProfileBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllContractsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ContractsRepository>(
    () => ContractsRepozitoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ContractsRemoteDataSource>(
    () => ContractsRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<ContractsLocalDataSource>(
    () => ContractsLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
