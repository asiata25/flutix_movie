import 'package:flutix_movie/commons/pages/home_page.dart';
import 'package:flutix_movie/commons/widgets/loader.dart';
import 'package:flutix_movie/core/utils/show_snakbar.dart';
import 'package:flutix_movie/features/auth/presentation/bloc/remote/bloc/auth_remote_bloc.dart';
import 'package:flutix_movie/features/auth/presentation/pages/login_page.dart';
import 'package:flutix_movie/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController teEmailController = TextEditingController();
  final TextEditingController tePasswordController = TextEditingController();
  final TextEditingController teNameController = TextEditingController();

  @override
  void dispose() {
    teEmailController.dispose();
    tePasswordController.dispose();
    teNameController.dispose();
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
                Navigator.pushReplacement(context, HomePage.route());
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
                    "Sign Up.",
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
                    height: 20,
                  ),
                  AuthField(
                    hintText: "Name",
                    icon: Icons.badge,
                    teController: teNameController,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          final email = teEmailController.text;
                          final password = tePasswordController.text;
                          final name = teNameController.text;

                          if (email.isNotEmpty &&
                              password.isNotEmpty &&
                              name.isNotEmpty) {
                            context.read<AuthRemoteBloc>().add(AuthSignUp(
                                name: name, email: email, password: password));
                          }
                        },
                        child: const Text(
                          "Submit",
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, LoginPage.route());
                      },
                      child: const Text(
                        "Login? Here",
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
