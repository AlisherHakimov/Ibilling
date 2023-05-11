// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_bloc.dart';

abstract class NewEvent extends Equatable {
  const NewEvent();

  @override
  List<Object> get props => [];
}

class SelectNewItemEvent extends NewEvent {
  String type;
  SelectNewItemEvent({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class NewInitialEvent extends NewEvent {}
