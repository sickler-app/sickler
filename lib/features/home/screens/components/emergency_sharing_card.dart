import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class EmergencySharingCard extends StatelessWidget {
  final VoidCallback onPressed;
  const EmergencySharingCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      splashFactory: InkSparkle.splashFactory,
      splashColor: theme.colorScheme.error.withValues(alpha:.2),
      onTap: onPressed,
      child: Ink(
        height: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isDarkMode ? theme.cardColor : AppColours.red95,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Emergency",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColours.red50),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/svg/emergency-alt.svg",
                  colorFilter: const ColorFilter.mode(
                      AppColours.red50, BlendMode.srcIn),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 114,
              width: 114,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode ? AppColours.red10 : AppColours.red90,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/emergency-alt.svg",
                  height: 48,
                  colorFilter: const ColorFilter.mode(
                      AppColours.red50, BlendMode.srcIn),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Start Emergency Sharing",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
