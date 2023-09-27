import 'package:flutter/material.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class AuthSuccessScreen extends StatefulWidget {
  const AuthSuccessScreen({super.key});

  @override
  State<AuthSuccessScreen> createState() => _AuthSuccessScreenState();
}

class _AuthSuccessScreenState extends State<AuthSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Successfully Authenticated 😎",
              style: theme.textTheme.displaySmall,
            ),
            const SizedBox(height: 32),
            SicklerButton(onPressed: () {}, label: "Continue"),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
