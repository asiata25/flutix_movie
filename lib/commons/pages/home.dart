import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const Home(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home",
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<AuthRemoteBloc, AuthRemoteState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      context.read<AuthRemoteBloc>().add(AuthSignOut());
                      print("please restart app");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 20)),
                    child: const Text("Sign Out"));
              },
            )
          ],
        ),
      ),
    );
  }
}
