import 'package:flutix_movie/commons/pages/home_page.dart';
import 'package:flutix_movie/commons/pages/onboard_page.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutix_movie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<AuthRemoteBloc>().add(AuthGetCurrentUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<AuthRemoteBloc, AuthRemoteState>(
          listener: (context, state) async {
            await Future.delayed(const Duration(seconds: 1));
            if (state is AuthInitial) {
              Navigator.pushReplacement(context, OnboardPage.router());
            }

            if (state is AuthDone) {
              Navigator.pushReplacement(context, HomePage.route());
            }
          },
          child: Image.asset(
            "assets/images/logo.png",
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
