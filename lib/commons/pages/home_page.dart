import 'package:flutix_movie/commons/cubits/app_user/app_user_cubit.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<AppUserCubit, AppUserState>(
        builder: (context, state) {
          String displayName = "User";

          if (state is AppUserLoggedIn) {
            displayName = state.user.name;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "The Home",
                style: TextStyle(fontSize: 50),
              ),
              Text(displayName),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    // TODO: Implement proper sign out (core cann't depend on any feature)
                    context.read<AuthRemoteBloc>().add(AuthSignOut());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20)),
                  child: const Text("Sign Out"))
            ],
          );
        },
      ),
    ));
  }
}
