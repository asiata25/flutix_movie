import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/core/usecase/usecase.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';

class UserSignout extends Usecase<DataState<String>, void> {
  final AuthRepository _authRepository;

  UserSignout(AuthRepository authRepository) : _authRepository = authRepository;

  @override
  Future<DataState<String>> call({void params}) async {
    return await _authRepository.signOut();
  }
}
