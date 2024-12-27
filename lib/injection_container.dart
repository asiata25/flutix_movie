import 'package:flutix_movie/core/commons/cubits/app_user/app_user_cubit.dart';
import 'package:flutix_movie/features/auth/data/data_source/remote/auth_remote_source.dart';
import 'package:flutix_movie/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';
import 'package:flutix_movie/features/auth/domain/usecase/get_current_user.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signin.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signout.dart';
import 'package:flutix_movie/features/auth/domain/usecase/user_signup.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutix_movie/core/constant/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // Initialize Supabase
  final supabase = await Supabase.initialize(
    url: supabseUrl,
    anonKey: supabseAnonKey,
  );

  // External Dependencies
  locator
    ..registerLazySingleton<SupabaseClient>(() => supabase.client)
    ..registerLazySingleton<AppUserCubit>(
      () => AppUserCubit(),
    );

  _authSetup();
}

void _authSetup() {
  // Data Sources
  locator
    ..registerLazySingleton<AuthRemoteSource>(
      () => SupabaseDataSource(
        locator<SupabaseClient>(),
      ),
    )

    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        locator<AuthRemoteSource>(),
      ),
    )

    // Use Cases
    ..registerLazySingleton<UserSignup>(
      () => UserSignup(
        locator<AuthRepository>(),
      ),
    )
    ..registerLazySingleton<UserSignout>(
        () => UserSignout(locator<AuthRepository>()))
    ..registerLazySingleton<UserSignin>(
        () => UserSignin(locator<AuthRepository>()))
    ..registerLazySingleton<GetCurrentUser>(
        () => GetCurrentUser(locator<AuthRepository>()))

    // BLoCs
    ..registerFactory<AuthRemoteBloc>(
      () => AuthRemoteBloc(
          locator<UserSignup>(),
          locator<UserSignout>(),
          locator<UserSignin>(),
          locator<GetCurrentUser>(),
          locator<AppUserCubit>()),
    );
}
