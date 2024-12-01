import 'package:flutix_movie/features/auth/presentation/pages/login_page.dart';
import 'package:flutix_movie/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

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
          child: Column(
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
                obscureText: true,
                teController: teNameController,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => {},
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
          ),
        ),
      ),
    );
  }
}
