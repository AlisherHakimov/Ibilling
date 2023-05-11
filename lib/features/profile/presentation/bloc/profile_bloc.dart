import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState(locale: const Locale('en'))) {
    on<SelectLanguageEvent>((event, emit) {
      emit(ProfileCurrentStateState(locale: event.locale));
    });
  }
}
