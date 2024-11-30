part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthDone extends AuthState {
  final UserEntity user;
  const AuthDone(this.user);
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}
