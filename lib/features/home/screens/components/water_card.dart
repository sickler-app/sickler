import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';

class WaterCard extends StatelessWidget {
  final VoidCallback onPressed;
  final int totalToday;
  final String unit;
  final int remaining;
  final double percentageCompleted;
  const WaterCard(
      {super.key,
      required this.onPressed,
      required this.totalToday,
      required this.unit,
      required this.remaining,
      required this.percentageCompleted});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      splashFactory: InkSparkle.splashFactory,
      splashColor: theme.colorScheme.tertiary.withValues(alpha:.2),
      child: Ink(
        padding: const EdgeInsets.all(kPadding16),
        decoration: BoxDecoration(
          // color: isDarkMode
          //     ? theme.cardColor
          //     : theme.colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: isDarkMode
                  ? AppColours.neutral20
                  : AppColours.neutral95),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/droplet-alt-filled.svg",
                            colorFilter: ColorFilter.mode(
                                theme.colorScheme.tertiary, BlendMode.srcIn),
                          ),
                          const Gap(4),
                          Text(
                            "Water",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: theme.colorScheme.tertiary),
                          ),
                        ],
                      ),
                      const Gap(kPadding16),
                      Text(
                        "Today's Total",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: AppColours.neutral50),
                      ),
                      Text("$totalToday $unit",
                          style: theme.textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.colorScheme.tertiary,
                              height: 1)),
                      const Gap(kPadding16),
                      Text(
                        "Remaining",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: AppColours.neutral50),
                      ),

                      Text("$remaining $unit",
                          style: theme.textTheme.titleMedium),

                      // Text(
                      //   "Completion",
                      //   style: theme.textTheme.bodySmall!
                      //       .copyWith(color: SicklerColours.neutral50),
                      // ),
                      // Text("$percentageCompleted %",
                      //     style: theme.textTheme.titleMedium),
                    ],
                  ),
                ),
                CustomCircularPercentIndicator(
                  // animateFromLastPercent: true,
                  // animation: true,
                  // circularStrokeCap: CircularStrokeCap.round,
                  radius: 64,
                  // progressColor: theme.colorScheme.tertiary,
                  // lineWidth: 24,
                  backgroundColor: isDarkMode
                      ? AppColours.neutral30
                      : AppColours.blue90,
                  progress: (percentageCompleted / 100) > 1
                      ? 1
                      : (percentageCompleted / 100),
                  shouldAnimate: true,
                  isSmall: true,
                  value: "${percentageCompleted.toInt()}", unit: unit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
