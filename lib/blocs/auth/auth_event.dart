part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent{
  final String email;

  const AuthCheckEmail(this.email);
  @override
  List<Object> get props => [email];

}

class AuthRegister extends AuthEvent{
  final SignUpModel data;

  const AuthRegister(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent{
  final SignInModel data;

  const AuthLogin(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}