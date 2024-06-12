import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
              style: theme.textTheme.displayMedium!
                  .copyWith(fontWeight: FontWeight.w600, height: 1.5),
            ).animate().fade(delay: 300.ms, duration: 600.ms).moveY(
                delay: 300.ms,
                duration: 600.ms,
                begin: 72,
                end: 0,
                curve: Curves.easeInOut),
            const Gap(96 + 64),
          ],
        ),
      ),
    );
  }
}
