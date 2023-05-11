// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:ibilling/config/strings.dart';
import 'package:ibilling/core/error/exeptions.dart';

import '../models/contract.dart';

abstract class ContractsLocalDataSource {
  Future<List<ContractModel>> getLastContractsFromCache();
  Future<void> contractsToCache(List<ContractModel> contracts);
}

class ContractsLocalDataSourceImpl implements ContractsLocalDataSource {
  SharedPreferences sharedPreferences;
  ContractsLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<List<ContractModel>> getLastContractsFromCache() {
    final jsonContractsList =
        sharedPreferences.getStringList(CACHED_CONTRACTS_LIST);
    if (jsonContractsList!.isNotEmpty) {
      return Future.value(jsonContractsList
          .map((contract) => ContractModel.fromJson(json.decode(contract)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> contractsToCache(List<ContractModel> contracts) async {
    final List<String> jsonContractsList =
        contracts.map((contract) => json.encode(contract.toJson())).toList();
    sharedPreferences.setStringList(CACHED_CONTRACTS_LIST, jsonContractsList);
    // ignore: void_checks
    return Future.value(jsonContractsList);
  }
}
