import 'package:flutix_movie/core/constant/constant.dart';
import 'package:flutix_movie/core/theme/app_theme.dart';
import 'package:flutix_movie/features/auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabseUrl,
    anonKey: supabseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      home: const Login(title: 'Flutter Demo Home Page'),
    );
  }
}
