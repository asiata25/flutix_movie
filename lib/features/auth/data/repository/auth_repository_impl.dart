import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/data/data_source/remote/auth_remote_source.dart';
import 'package:flutix_movie/features/auth/domain/entity/user_entity.dart';
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
    try {
      final res = await _authRemoteSource.createNewUser(
          email: email, password: password, name: name);

      if (res is DataFailed) {
        return DataFailed(res.error!);
      }

      return DataSuccess(res.data!);
    } catch (e) {
      return DataFailed(Exception(e));
    }
  }

  @override
  Future<DataState<UserEntity>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final res =
          await _authRemoteSource.signInUser(email: email, password: password);

      if (res is DataFailed) {
        return DataFailed(res.error!);
      }

      return DataSuccess(res.data!);
    } catch (e) {
      return DataFailed(Exception(e));
    }
  }

  @override
  Future<DataState<String>> signOut() async {
    try {
      final res = await _authRemoteSource.signOutUser();

      if (res is DataFailed) {
        return DataFailed(res.error!);
      }

      return DataSuccess(res.data!);
    } catch (e) {
      return DataFailed(Exception(e));
    }
  }
}
