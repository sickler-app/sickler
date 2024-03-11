import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/global_components.dart';


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
        const Gap(16),
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
        const Gap(32),
        SicklerDateSwitcher(
            onNextPressed: () {},
            onPreviousPressed: () {},
            label: "November, 2023"),

        const Gap(32),

        CalendarDatePicker(
          initialDate: DateTime(9),
          firstDate: DateTime(1),
          lastDate: DateTime(12),
          onDateChanged: (DateTime date) {},
        ),

        ///Todo: Put Calendar Widget here
      ],
    );
  }
}
