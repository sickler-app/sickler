import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/components.dart';

class CrisisHistoryMonthly extends StatelessWidget {
  const CrisisHistoryMonthly({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Monthly",
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
        ),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "13",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: " Crises events this month",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const Gap(24),
        DateSwitcher(
            onNextPressed: () {},
            onPreviousPressed: () {},
            label: "November, 2023"),

        const Gap(24),

        CalendarDatePicker(
          initialDate: DateTime(9),
          firstDate: DateTime(1),
          lastDate: DateTime(12),
          onDateChanged: (DateTime date) {},
        ),

        ///Todo: Rebuild Calendar Widget here
      ],
    );
  }
}
