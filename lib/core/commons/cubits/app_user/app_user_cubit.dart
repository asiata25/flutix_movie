import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix_movie/core/commons/entities/user_entity.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserLoading());

  void updateUser(UserEntity? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoaded(user));
    }
  }
}
