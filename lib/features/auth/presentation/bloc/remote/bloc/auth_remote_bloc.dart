import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix_movie/commons/entities/user_entity.dart';
import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/domain/usecase/get_current_user.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signin.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signout.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signup.dart';
import 'package:meta/meta.dart';

part 'auth_remote_event.dart';
part 'auth_remote_state.dart';

class AuthRemoteBloc extends Bloc<AuthRemoteEvent, AuthRemoteState> {
  final UserSignup _userSignup;
  final UserSignout _userSignout;
  final UserSignin _userSignin;
  final GetCurrentUser _getCurrentUser;

  AuthRemoteBloc(UserSignup userSignup, UserSignout userSignout,
      UserSignin userSignin, GetCurrentUser getCurrentUser)
      : _userSignup = userSignup,
        _userSignout = userSignout,
        _userSignin = userSignin,
        _getCurrentUser = getCurrentUser,
        super(AuthInitial()) {
    on<AuthRemoteEvent>((event, emit) => emit(AuthLoading()));
    on<AuthGetCurrentUser>(_onRetriveSession);
    on<AuthSignUp>(_onUserSignUp);
    on<AuthSignIn>(_onUserSignIn);
    on<AuthSignOut>(_onUserSignOut);
  }

  void _onRetriveSession(event, emit) async {
    final user = await _getCurrentUser.call();

    if (user.data != null) {
      emit(AuthDone(user.data!));
      return;
    }

    emit(AuthInitial());
  }

  void _onUserSignUp(event, emit) async {
    // emit(AuthLoading());

    final user = await _userSignup(
        params: UserSignupParams(
            email: event.email, password: event.password, name: event.name));

    if (user is DataSuccess && user.data != null) {
      emit(AuthDone(user.data!));
    }

    if (user is DataFailed) {
      emit(AuthError(user.errorMessage!));
    }
  }

  void _onUserSignIn(event, emit) async {
    // emit(AuthLoading());

    final user = await _userSignin(
        params: UserSigninParams(email: event.email, password: event.password));

    if (user is DataSuccess && user.data != null) {
      emit(AuthDone(user.data!));
    }

    if (user is DataFailed) {
      emit(AuthError(user.errorMessage!));
    }
  }

  void _onUserSignOut(event, emit) async {
    // emit(AuthLoading());

    final res = await _userSignout();

    if (res is DataFailed) {
      emit(AuthError(res.errorMessage!));
    }

    if (res is DataSuccess) {
      emit(AuthInitial());
    }
  }
}
