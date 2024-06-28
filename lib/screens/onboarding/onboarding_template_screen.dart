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
            )
                .animate()
                .moveY(
                    duration: 1200.ms,
                    begin: 120,
                    end: 0,
                    curve: Curves.easeInOutQuart)
                .fadeIn(
                  delay: 300.ms,
                  duration: 800.ms,
                ),
            const Gap(96 + 64),
          ],
        ),
      ),
    );
  }
}
