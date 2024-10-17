import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import 'components.dart';

class MedsReminderCard extends StatelessWidget {
  const MedsReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColours.neutral95,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Meds",
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.colorScheme.primary),
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/svg/medication.svg",
                colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary, BlendMode.srcIn),
              )
            ],
          ),
          const MedsReminderItem(),
          const MedsReminderItem(),
          const MedsReminderItem(),
        ],
      ),
    );
  }
}
