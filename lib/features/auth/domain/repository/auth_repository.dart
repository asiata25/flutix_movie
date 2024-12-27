import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/core/commons/entities/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> signUpWithEmail(
      {required String email, required String password, required String name});
  Future<DataState<UserEntity>> signInWithEmail(
      {required String email, required String password});
  Future<DataState<String>> signOut();
  Future<DataState<UserEntity>> getCurrentUser();
}
