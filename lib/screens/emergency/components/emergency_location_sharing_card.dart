import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class EmergencyLocationSharingCard extends StatelessWidget {
  const EmergencyLocationSharingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: theme.colorScheme.error,),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Emergency Sharing\nIn Progress",
                style: theme.textTheme.headlineSmall!
                    .copyWith(color: SicklerColours.white),
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/svg/location.svg",
                colorFilter: ColorFilter.mode(
                    theme.scaffoldBackgroundColor, BlendMode.srcIn),
              )
            ],
          ),
          const Gap(24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sharing ends in",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: SicklerColours.white),
                  ),

                  Text(
                    "2h 43m 15s",
                    style: theme.textTheme.bodyLarge!.copyWith(
                        color: SicklerColours.white,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const Spacer(),
               SicklerButton( isChipButton:true,
                onPressed: () {},
                label: 'Stop Sharing',
                iconPath: "assets/svg/location-off.svg",
                backgroundColor: SicklerColours.white,
                color: theme.colorScheme.error,
              )
            ],
          )

        ],
      ),
    );
  }
}
