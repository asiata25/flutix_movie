import 'package:bloc/bloc.dart';
import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/domain/entity/user_entity.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signup.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;

  AuthBloc(UserSignup userSignup)
      : _userSignup = userSignup,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final user = await _userSignup(
          params: UserSignupParams(
              email: event.email, password: event.password, name: event.name));

      if (user is DataSuccess && user.data != null) {
        emit(AuthDone(user.data!));
      }

      if (user is DataFailed) {
        emit(AuthError(user.error.toString()));
      }
    });
  }
}
