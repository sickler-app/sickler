import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'components.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget child;
  final String buttonLabel;
  const AppBottomSheet(
      {super.key,
      required this.title,
      required this.onPressed,
      this.buttonLabel = "Continue",
      required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(12),
            Container(
              height: 6,
              width: 42,
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const Gap(12),
            Text(title,
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 16,
            ),
            child,
            const Gap(32),
            AppButton(onPressed: onPressed, label: buttonLabel),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
