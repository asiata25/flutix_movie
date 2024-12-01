import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/core/usecase/usecase.dart';
import 'package:flutix_movie/commons/entities/user_entity.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class UserSignin extends Usecase<DataState<UserEntity>, UserSigninParams> {
  final AuthRepository _authRepository;

  UserSignin(AuthRepository authRepository) : _authRepository = authRepository;

  @override
  Future<DataState<UserEntity>> call({UserSigninParams? params}) async {
    return await _authRepository.signInWithEmail(
        email: params?.email ?? "", password: params?.password ?? "");
  }
}

class UserSigninParams extends Equatable {
  final String email;
  final String password;

  const UserSigninParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
