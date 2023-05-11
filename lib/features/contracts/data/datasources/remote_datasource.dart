import '../../../../core/error/exeptions.dart';
import '../models/contract.dart';
import 'package:dio/dio.dart';

abstract class ContractsRemoteDataSource {
  Future<List<ContractModel>> getAllContracts();
}

class ContractsRemoteDataSourceImpl implements ContractsRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<ContractModel>> getAllContracts() async {
    final response = await dio
        .get('https://644caea3cfdddac97094741d.mockapi.io/all_contracts');
    if (response.statusCode == 200) {
      final data = response.data as List;
      final contracts =
          data.map((json) => ContractModel.fromJson(json)).toList();
      return contracts;
    } else {
      throw ServerException();
    }
  }
}
