import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const id = "loading_screen";
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FittedBox(child: CircularProgressIndicator()),
      ),
    );
  }
}
