part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  const SavedState();
}

class SavedInitialState extends SavedState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SavedsInitialState extends SavedState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SavedSearchState extends SavedState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SavedFilterState extends SavedState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
