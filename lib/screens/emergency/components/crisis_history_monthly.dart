import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'components.dart';

class CrisisHistoryMonthly extends StatelessWidget {
  const CrisisHistoryMonthly({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "Monthly",
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        Gap(24),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "13",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              TextSpan(
                text: "Crises events this month",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Gap(24),

        ///Todo: put the next previous widget here
        Gap(24),

        ///Todo: Put Calendar Widget here
      ],
    );
  }
}
