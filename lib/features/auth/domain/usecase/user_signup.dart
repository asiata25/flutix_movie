import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/core/usecase/usecase.dart';
import 'package:flutix_movie/commons/entities/user_entity.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class UserSignup extends Usecase<DataState<UserEntity>, UserSignupParams> {
  final AuthRepository _authRepository;

  UserSignup(AuthRepository authRepository) : _authRepository = authRepository;

  @override
  Future<DataState<UserEntity>> call({UserSignupParams? params}) async {
    return await _authRepository.signUpWithEmail(
        email: params?.email ?? "",
        password: params?.password ?? "",
        name: params?.name ?? "");
  }
}

class UserSignupParams extends Equatable {
  final String email;
  final String password;
  final String name;

  const UserSignupParams(
      {required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password, name];
}
