import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/components.dart';
import 'components.dart';

class CrisisHistoryWeekly extends StatelessWidget {
  const CrisisHistoryWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weekly",
          style:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        const Gap(16),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "3",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              TextSpan(
                  text: " Crises events this week ",
                  style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
        const Gap(32),
        SicklerCalendarWeekSelector(selectedDay: (selectedDay) {}),
        const Gap(24),
        DateSwitcher(
            onNextPressed: () {},
            onPreviousPressed: () {},
            label: "Wednesday 03, Nov"),
        const Gap(24),
        const Row(
          children: [
            // SizedBox(
            //   width: 20,
            //   height: 500,
            //   child: ListView.separated(
            //     padding: EdgeInsets.zero,
            //       physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //           height: 100,
            //           width: 6,
            //           decoration:
            //               BoxDecoration(
            //                   borderRadius: BorderRadius.circular(6),
            //                   color: SicklerColours.neutral95),
            //         );
            //       },
            //       separatorBuilder: (context, index) {
            //         return Container(
            //           width: 12,
            //           height: 12,
            //           decoration: BoxDecoration(
            //               color: SicklerColours.neutral90,
            //               shape: BoxShape.circle),
            //         );
            //       },
            //       itemCount: 5),
            // ),
            // Gap(8),
            Expanded(
              child: Column(
                children: [
                  CrisisLogCard(),
                  Gap(8),
                  CrisisLogCard(),
                  Gap(8),
                  CrisisLogCard(),
                  Gap(8),
                  CrisisLogCard(),
                  Gap(64),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
