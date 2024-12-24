import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController teController;

  const AuthField({
    super.key,
    required this.hintText,
    required this.teController,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: teController,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(hintText: hintText, suffixIcon: Icon(icon)),
    );
  }
}
