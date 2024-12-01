import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthRemoteBloc, AuthRemoteState>(
      builder: (context, state) {
        String displayText = "Welcome";

        if (state is AuthDone) {
          displayText = state.user.rawUserMetaData!.displayName!;
        }

        if (state is AuthError) {
          displayText = state.message;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Flutix"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  displayText,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<AuthRemoteBloc>().add(AuthSignOut()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
