import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibilling/config/strings.dart';

part 'new_event.dart';
part 'new_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc() : super(NewInitialState()) {
    on<SelectNewItemEvent>((event, emit) {
      if (event.type == CONTRACT) {
        emit(NewContractState());
      } else {
        emit(NewInvoiceState());
      }
    });
    on<NewInitialEvent>(
      (event, emit) => emit(NewInitialState()),
    );
  }
}
