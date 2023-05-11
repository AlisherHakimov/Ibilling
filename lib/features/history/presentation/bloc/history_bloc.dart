import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistorysInitialState()) {
    on<HistoryInitial>((event, emit) {
      emit(HistoryInitialState());
    });
    on<HistorySearchTap>((event, emit) {
      emit(HistorySearchState());
    });
    on<HistoryFilterTap>((event, emit) {
      emit(HistoryFilterState());
    });
  }
}
