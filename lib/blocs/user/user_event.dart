part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserGetByUsername extends UserEvent{
  final String username;

  const UserGetByUsername(this.username);

  @override
  // TODO: implement props
  List<Object> get props => [username];
}

class UserGetRecent extends UserEvent{}
