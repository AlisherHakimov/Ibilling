part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitialState extends HistoryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HistorysInitialState extends HistoryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HistorySearchState extends HistoryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HistoryFilterState extends HistoryState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
