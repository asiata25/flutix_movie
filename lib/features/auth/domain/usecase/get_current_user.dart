import 'package:flutix_movie/core/commons/entities/user_entity.dart';
import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/core/usecase/usecase.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUser extends Usecase<DataState<UserEntity>, void> {
  final AuthRepository _authRepository;

  GetCurrentUser(AuthRepository authRepository)
      : _authRepository = authRepository;

  @override
  Future<DataState<UserEntity>> call({void params}) async {
    return _authRepository.getCurrentUser();
  }
}
