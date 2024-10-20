import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';

class MedsHistoryItem extends StatelessWidget {
  const MedsHistoryItem({super.key, this.mode = MedsHistoryMode.daily});
  final MedsHistoryMode mode;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.cardColor))),
      child: Row(
        ///The Compressed Mode
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode
                    ? AppColours.neutral20
                    : AppColours.neutral95),
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/medication.svg",
                height: 20,
                colorFilter:
                    const ColorFilter.mode(AppColours.neutral50, BlendMode.srcIn),
              ),
            ),
          ),
          const Gap(16),
          RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hydroxyl Urea",
                  style: theme.textTheme.bodyLarge,
                )
                    .animate()
                    .slideX(
                        curve: Curves.easeOut,
                        duration: 500.ms,
                        begin: .3,
                        end: 0)
                    .fadeIn(
                        delay: 200.ms, curve: Curves.easeOut, duration: 500.ms),
                const Gap(8),
                Text(
                  "8:00 pm",
                  style: theme.textTheme.bodyMedium,
                )
                    .animate(delay: 500.ms)
                    .fadeIn(
                        delay: 200.ms, curve: Curves.easeOut, duration: 500.ms)
                    .slideX(
                        curve: Curves.easeOut,
                        duration: 500.ms,
                        begin: .3,
                        end: 0),
              ],
            ),
          ),
          const Spacer(),
          Visibility(
            visible: mode == MedsHistoryMode.weekly,
            child: SizedBox(
              height: 16,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Gap(4),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) => Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDarkMode
                          ? theme.cardColor
                          : AppColours.neutral90,
                    ),
                    shape: BoxShape.circle,
                    // color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: mode == MedsHistoryMode.daily,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary,
              ),
              child: const Icon(
                size: 16,
                FluentIcons.checkmark_20_filled,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
