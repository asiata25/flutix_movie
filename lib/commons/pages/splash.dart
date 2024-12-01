import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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
              "Flutix App",
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
                      onPressed: () => context.read<AuthRemoteBloc>()
                        ..add(AuthSignIn(
                            email: "asiatakh25@gmail.com",
                            password: "123qweasd")),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
                        print("Login");
                      })
              ])),
            )
          ],
        ),
      ),
    );
  }
}
