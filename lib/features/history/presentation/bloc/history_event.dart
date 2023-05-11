part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryEvent {}

class HistorySearchTap extends HistoryEvent {}

class HistoryFilterTap extends HistoryEvent {}
