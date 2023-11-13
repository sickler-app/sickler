import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'components.dart';

class CrisisHistoryDaily extends StatelessWidget {
  const CrisisHistoryDaily({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "Sunday, 24th",
          style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
        ),
        Gap(16),
        CrisisLogCard(),
        Gap(8),
        CrisisLogCard(),
        Gap(8),
        CrisisLogCard(),
        Gap(8),
        CrisisLogCard(),
      ],
    );
  }
}
