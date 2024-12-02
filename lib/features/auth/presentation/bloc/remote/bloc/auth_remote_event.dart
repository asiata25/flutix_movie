part of 'auth_remote_bloc.dart';

@immutable
class AuthRemoteEvent {}

final class AuthGetCurrentUser extends AuthRemoteEvent {}

final class AuthSignUp extends AuthRemoteEvent {
  final String name;
  final String email;
  final String password;

  AuthSignUp({required this.name, required this.email, required this.password});
}

final class AuthSignIn extends AuthRemoteEvent {
  final String email;
  final String password;

  AuthSignIn({required this.email, required this.password});
}

final class AuthSignOut extends AuthRemoteEvent {}
