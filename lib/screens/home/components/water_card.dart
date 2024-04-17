import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/core.dart';

class WaterCard extends StatelessWidget {
  final VoidCallback onPressed;
  const WaterCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      splashFactory: InkSparkle.splashFactory,
      splashColor: SicklerColours.blueSeed.withOpacity(.2),
      child: Ink(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 8,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: isDarkMode ? theme.cardColor : SicklerColours.blue95,
          borderRadius: BorderRadius.circular(24),
          //  border: Border.all(color: SicklerColours.neutral90),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/svg/droplet-alt-filled.svg",
                  colorFilter: const ColorFilter.mode(
                      SicklerColours.blueSeed, BlendMode.srcIn),
                ),
                Gap(4),
                Text(
                  "Water",
                  style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: SicklerColours.blueSeed),
                ),
              ],
            ),
            Gap(8),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("160 ml",
                              style: theme.textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: SicklerColours.blueSeed,
                                  height: 1)),
                        ],
                      ),
                      Gap(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Remaining",
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: SicklerColours.neutral50),
                          ),
                          //  Gap(4),
                          Text("200 ml",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w800, height: 1)),
                        ],
                      ),
                      Gap(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Completion",
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: SicklerColours.neutral50),
                          ),
                          Text("37%",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w800, height: 1)),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(16),
                CircularPercentIndicator(
                  animateFromLastPercent: true,
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: 64,
                  progressColor: SicklerColours.blueSeed,
                  lineWidth: 24,
                  backgroundColor: isDarkMode
                      ? SicklerColours.neutral30
                      : SicklerColours.white,
                  percent: .37,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
