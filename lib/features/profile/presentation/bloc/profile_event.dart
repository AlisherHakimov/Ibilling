// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class SelectLanguageEvent extends ProfileEvent {
  Locale locale;
  SelectLanguageEvent({
    required this.locale,
  });

  @override
  List<Object> get props => [];
}
