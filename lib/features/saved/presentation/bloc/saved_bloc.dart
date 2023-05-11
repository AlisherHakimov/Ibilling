import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedsInitialState()) {
    on<SavedInitial>((event, emit) {
      emit(SavedInitialState());
    });
    on<SavedSearchTap>((event, emit) {
      emit(SavedSearchState());
    });
    on<SavedFilterTap>((event, emit) {
      emit(SavedFilterState());
    });
  }
}
