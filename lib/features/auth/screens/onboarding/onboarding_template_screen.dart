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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: theme.textTheme.displaySmall!
                .copyWith(fontWeight: FontWeight.w700, height: 1.2),
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
    );
  }
}
