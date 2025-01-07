import 'package:flutix_movie/core/commons/pages/main_page.dart';
import 'package:flutix_movie/core/commons/widgets/loader.dart';
import 'package:flutix_movie/core/utils/show_snakbar.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutix_movie/features/auth/presentation/pages/signup_page.dart';
import 'package:flutix_movie/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController teEmailController = TextEditingController();
  final TextEditingController tePasswordController = TextEditingController();

  bool isInputValid = false;

  void _validateInput() {
    final isEmailValid = teEmailController.text.trim().isNotEmpty;
    final isPasswordValid = tePasswordController.text.isNotEmpty;

    setState(() {
      isInputValid = isEmailValid && isPasswordValid;
    });
  }

  @override
  void initState() {
    teEmailController.addListener(_validateInput);
    tePasswordController.addListener(_validateInput);
    super.initState();
  }

  @override
  void dispose() {
    teEmailController.removeListener(_validateInput);
    tePasswordController.removeListener(_validateInput);

    teEmailController.dispose();
    tePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: BlocConsumer<AuthRemoteBloc, AuthRemoteState>(
            listener: (context, state) {
              if (state is AuthError) {
                showSnackBar(context, state.message);
              }

              if (state is AuthDone) {
                Navigator.pushReplacement(context, MainPage.route());
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Loader();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login.",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthField(
                    hintText: "Email",
                    icon: Icons.mail,
                    teController: teEmailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthField(
                    hintText: "Password",
                    icon: Icons.lock,
                    obscureText: true,
                    teController: tePasswordController,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: isInputValid
                            ? () {
                                final email = teEmailController.text;
                                final password = tePasswordController.text;

                                context.read<AuthRemoteBloc>().add(AuthSignIn(
                                    email: email, password: password));
                              }
                            : null,
                        child: const Text(
                          "Submit",
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, SignupPage.route());
                      },
                      child: const Text(
                        "Sign Up? Here",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
