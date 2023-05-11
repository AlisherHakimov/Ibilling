import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:ibilling/core/utils/failure_to_message.dart';
import 'package:ibilling/features/contracts/domain/entities/contract.dart';
import 'package:ibilling/features/contracts/domain/usecases/get_all_contracts.dart';

part 'contracts_event.dart';
part 'contracts_state.dart';

class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {
  final GetAllContractsUseCase getAllContracts;
  List<ContractEntity> _contracts = [];
  List<ContractEntity> currentContracts = [];
  ContractsBloc({required this.getAllContracts})
      : super(LoadingContractsState()) {
    on<LoadContractsEvent>(
      (event, emit) async {
        final contracts = await getAllContracts();
        contracts.fold(
          (failure) {
            emit(ErrorContractsState(message: mapFailureToMessage(failure)));
          },
          (contracts) {
            _contracts = contracts;
            emit(LoadedContractsState(contracts: _contracts));
          },
        );
      },
    );

    on<SelectDateTimeEvent>(
      (event, emit) {
        String selectedDateTime =
            DateFormat("yyy-MM-dd").format(event.dateTime).toString();

        currentContracts =
            _contracts.where((e) => e.dateTime == selectedDateTime).toList();
        emit(LoadedContractsState(contracts: currentContracts));
      },
    );
    on<ApplyFilterEvent>((event, emit) {
      List<ContractEntity> filteredContracts = _contracts
          .where((contract) => isContainsToFilter(contract, event))
          .toList();
      emit(LoadedContractsState(contracts: filteredContracts));
    });
    on<ContractsFilterTapEvent>(
      (event, emit) => emit(FilterContractsState()),
    );
    on<ContractsSearchTapEvent>(
      (event, emit) => emit(SearchContractsState()),
    );
    on<FilterOrSearchExitEvent>(
      (event, emit) => emit(LoadedContractsState(contracts: currentContracts)),
    );
  }

  bool isContainsToFilter(ContractEntity contract, ApplyFilterEvent event) {
    DateTime dateTime = DateTime.parse(contract.dateTime);
    if (dateTime.isAfter(event.fromDate) &&
        dateTime.isBefore(event.toDate) &&
        event.selectedStatuses.contains(contract.status)) {
      return true;
    } else {
      return false;
    }
  }
}
