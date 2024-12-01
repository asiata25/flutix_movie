import 'package:flutix_movie/features/auth/data/data_source/remote/auth_remote_source.dart';
import 'package:flutix_movie/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutix_movie/features/auth/domain/repository/auth_repository.dart';
import 'package:flutix_movie/features/auth/domain/usecase/retrive_session.dart';
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
  locator.registerLazySingleton<SupabaseClient>(() => supabase.client);

  // Data Sources
  locator.registerLazySingleton<AuthRemoteSource>(
    () => SupabaseDataSource(
      locator<SupabaseClient>(),
    ),
  );

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      locator<AuthRemoteSource>(),
    ),
  );

  // Use Cases
  locator.registerLazySingleton<UserSignup>(
    () => UserSignup(
      locator<AuthRepository>(),
    ),
  );
  locator.registerLazySingleton<UserSignout>(
      () => UserSignout(locator<AuthRepository>()));
  locator.registerLazySingleton<UserSignin>(
      () => UserSignin(locator<AuthRepository>()));
  locator.registerLazySingleton<RetriveSession>(
      () => RetriveSession(locator<AuthRepository>()));

  // BLoCs
  locator.registerFactory<AuthRemoteBloc>(
    () => AuthRemoteBloc(locator<UserSignup>(), locator<UserSignout>(),
        locator<UserSignin>(), locator<RetriveSession>()),
  );
}
