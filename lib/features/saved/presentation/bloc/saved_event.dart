part of 'saved_bloc.dart';

abstract class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class SavedInitial extends SavedEvent {}

class SavedSearchTap extends SavedEvent {}

class SavedFilterTap extends SavedEvent {}
