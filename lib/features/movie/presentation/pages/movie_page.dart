import 'package:flutix_movie/features/movie/presentation/widgets/header.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [Header()],
    );
  }
}
