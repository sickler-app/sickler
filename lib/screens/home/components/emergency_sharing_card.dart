import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';

class EmergencySharingCard extends StatelessWidget {
  const EmergencySharingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: SicklerColours.red95,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Emergency",
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: SicklerColours.red50),
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/svg/emergency.svg",
                colorFilter: const ColorFilter.mode(
                    SicklerColours.red50, BlendMode.srcIn),
              )
            ],
          ),
          const Spacer(),
          Container(
            height: 114,
            width: 114,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: SicklerColours.red90,
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/emergency.svg",
                height: 48,
                colorFilter: const ColorFilter.mode(
                    SicklerColours.red50, BlendMode.srcIn),
              ),
            ),
          ),
          const Spacer(),
          Text(
            "Start Emergency Sharing",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          const Gap( 16),
        ],
      ),
    );
  }
}
