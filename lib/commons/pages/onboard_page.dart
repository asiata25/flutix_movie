import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutix_movie/features/auth/presentation/pages/login_page.dart';
import 'package:flutix_movie/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  static router() => MaterialPageRoute(
        builder: (context) => const OnboardPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg-splash.png"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.fromLTRB(16, 200, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "WELCOME TO",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutix Movie",
              style: TextStyle(fontSize: 42),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Millions of movies, TV shows and people to discover. Explore now.",
              style: TextStyle(fontSize: 16),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<AuthRemoteBloc, AuthRemoteState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () =>
                          {Navigator.push(context, SignupPage.route())},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Get Started",
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(text: "Already have an account? ", children: [
                TextSpan(
                    text: "Login",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context, LoginPage.route());
                      })
              ])),
            )
          ],
        ),
      ),
    );
  }
}
