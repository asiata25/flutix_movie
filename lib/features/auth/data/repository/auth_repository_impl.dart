import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/data/data_source/remote/auth_remote_source.dart';
import 'package:flutix_movie/core/commons/entities/user_entity.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteSource _authRemoteSource;

  AuthRepositoryImpl(AuthRemoteSource authRemoteSource)
      : _authRemoteSource = authRemoteSource;

  @override
  Future<DataState<UserEntity>> signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    return _getUser(() async => await _authRemoteSource.createNewUser(
        email: email, password: password, name: name));
  }

  @override
  Future<DataState<UserEntity>> signInWithEmail(
      {required String email, required String password}) async {
    return _getUser(() async =>
        await _authRemoteSource.signInUser(email: email, password: password));
  }

  @override
  Future<DataState<String>> signOut() async {
    try {
      final res = await _authRemoteSource.signOutUser();

      if (res is DataFailed) {
        return DataFailed(res.errorMessage!);
      }

      return DataSuccess(res.data!);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<UserEntity>> getCurrentUser() async {
    final res = await _authRemoteSource.retriveCurrentUser();

    if (res is DataFailed) {
      return DataFailed(res.errorMessage!);
    }

    return DataSuccess(res.data!);
  }
}

Future<DataState<UserEntity>> _getUser(
    Future<DataState<UserEntity>> Function() callback) async {
  try {
    final res = await callback();

    if (res is DataFailed) {
      return DataFailed(res.errorMessage!);
    }

    return DataSuccess(res.data!);
  } catch (e) {
    return DataFailed(e.toString());
  }
}
