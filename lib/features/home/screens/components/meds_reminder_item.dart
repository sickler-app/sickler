import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';



class MedsReminderItem extends StatelessWidget {
  const MedsReminderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColours.neutral90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hydroxyl Urea",
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const Gap(8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "12:00 pm",
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }
}
