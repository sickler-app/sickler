import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';

class AuthSuccessScreen extends StatefulWidget {
  static const id = "auth_success";
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
            const Gap(32),
            SicklerButton(
                onPressed: () {
                  context.goNamed(ProfileBasicInfoScreen.id);
                },
                label: "Continue"),
            const Gap(64),
          ],
        ),
      ),
    );
  }
}
