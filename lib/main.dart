import 'package:flutix_movie/core/commons/cubits/app_user/app_user_cubit.dart';
import 'package:flutix_movie/core/commons/pages/main_page.dart';
import 'package:flutix_movie/core/commons/pages/onboard_page.dart';
import 'package:flutix_movie/core/commons/pages/splash_screen.dart';
import 'package:flutix_movie/core/theme/app_theme.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutix_movie/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => locator<AppUserCubit>()),
      BlocProvider(create: (context) => locator<AuthRemoteBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.read<AuthRemoteBloc>().add(AuthGetCurrentUser());
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.defaultTheme,
        home: BlocSelector<AppUserCubit, AppUserState, Widget>(
          selector: (state) {
            if (state is AppUserInitial) {
              return const OnboardPage();
            } else if (state is AppUserLoaded) {
              return const MainPage();
            } else {
              return const SplashScreen();
            }
          },
          builder: (context, page) {
            return page;
          },
        ));
  }
}
