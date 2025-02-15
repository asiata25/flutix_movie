part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object> get props => [];
}

final class AppUserLoading extends AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoaded extends AppUserState {
  final UserEntity user;

  const AppUserLoaded(this.user);
}
