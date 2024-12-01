import 'package:flutix_movie/commons/entities/user_entity.dart';
import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/core/usecase/usecase.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';

class RetriveSession extends Usecase<DataState<UserEntity>, void> {
  final AuthRepository _authRepository;

  RetriveSession(AuthRepository authRepository)
      : _authRepository = authRepository;

  @override
  Future<DataState<UserEntity>> call({void params}) async {
    return _authRepository.retriveSession();
  }
}
