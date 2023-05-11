part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  ProfileState(this.locale);
  Locale locale;
  @override
  List<Object> get props => [locale];
}

class ProfileInitialState extends ProfileState {
  @override
  Locale locale;

  ProfileInitialState({
    required this.locale,
  }) : super(locale);

  @override
  List<Object> get props => [locale];
}

class ProfileCurrentStateState extends ProfileState {
  @override
  Locale locale;

  ProfileCurrentStateState({
    required this.locale,
  }) : super(locale);

  @override
  List<Object> get props => [locale];
}
