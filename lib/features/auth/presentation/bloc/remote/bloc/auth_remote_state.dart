part of 'auth_remote_bloc.dart';

@immutable
sealed class AuthRemoteState extends Equatable {
  const AuthRemoteState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthRemoteState {}

final class AuthDone extends AuthRemoteState {
  final UserEntity user;
  const AuthDone(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthRemoteState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
