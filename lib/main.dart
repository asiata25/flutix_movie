import 'package:flutix_movie/core/theme/app_theme.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_bloc.dart';
import 'package:flutix_movie/injection_container.dart';
import 'package:flutix_movie/features/auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => locator<AuthBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      home: const Login(),
    );
  }
}
