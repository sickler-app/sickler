import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import 'components.dart';

class CrisisHistoryWeekly extends StatelessWidget {
  const CrisisHistoryWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "Weekly",
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(16),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "3",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              TextSpan(
                text: "Crises events this week ",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const Gap(32),
        SicklerCalendarWeekSelector(selectedDay: (selectedDay) {}),
        const Gap(24),
        SicklerDateSwitcher(
            onNextPressed: () {},
            onPreviousPressed: () {},
            label: "Wednesday 03, Nov"),
        const Gap(24),
        const CrisisLogCard(),
        const Gap(8),
        const CrisisLogCard(),
        const Gap(8),
        const CrisisLogCard(),
        const Gap(8),
        const CrisisLogCard(),
      ],
    );
  }
}