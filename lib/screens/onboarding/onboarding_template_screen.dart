import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingTemplateScreen extends StatelessWidget {
  final String text;
  final String illustration;

  const OnboardingTemplateScreen(
      {super.key, required this.text, required this.illustration});

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
              text,
              style: theme.textTheme.displaySmall,
            ),
            Gap( 96 + 64),
          ],
        ),
      ),
    );
  }
}
