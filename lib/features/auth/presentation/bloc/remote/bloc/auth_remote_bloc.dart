import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix_movie/commons/entities/user_entity.dart';
import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/domain/usecase/retrive_session.dart';
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
  final RetriveSession _retriveSession;

  AuthRemoteBloc(UserSignup userSignup, UserSignout userSignout,
      UserSignin userSignin, RetriveSession retriveSession)
      : _userSignup = userSignup,
        _userSignout = userSignout,
        _userSignin = userSignin,
        _retriveSession = retriveSession,
        super(AuthInitial()) {
    on<AuthRetriveSession>(_onRetriveSession);
    on<AuthSignUp>(_onUserSignUp);
    on<AuthSignIn>(_onUserSignIn);
    on<AuthSignOut>(_onUserSignOut);
  }

  void _onRetriveSession(event, emit) async {
    final session = await _retriveSession.call();

    if (session.data != null) {
      emit(AuthDone(session.data!));
    }
  }

  void _onUserSignUp(event, emit) async {
    final user = await _userSignup(
        params: UserSignupParams(
            email: event.email, password: event.password, name: event.name));

    if (user is DataSuccess && user.data != null) {
      emit(AuthDone(user.data!));
    }

    if (user is DataFailed) {
      emit(AuthError(user.error.toString()));
    }
  }

  void _onUserSignIn(event, emit) async {
    final user = await _userSignin(
        params: UserSigninParams(email: event.email, password: event.password));

    if (user is DataSuccess && user.data != null) {
      emit(AuthDone(user.data!));
    }

    if (user is DataFailed) {
      emit(AuthError(user.error.toString()));
    }
  }

  void _onUserSignOut(event, emit) async {
    final res = await _userSignout();

    if (res is DataFailed) {
      emit(AuthError(res.error.toString()));
    }
  }
}
