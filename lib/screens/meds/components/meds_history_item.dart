import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../global_components/global_components.dart';

class MedsHistoryItem extends StatelessWidget {
  const MedsHistoryItem({super.key, this.mode = MedsHistoryMode.daily});
  final MedsHistoryMode mode;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.cardColor))),
      child: Row(
        ///The Compressed Mode
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primaryContainer),
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/medication.svg",
                colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 16),
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
                const SizedBox(height: 8),
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
          mode == MedsHistoryMode.daily ? const Spacer() : const SizedBox(),
          mode == MedsHistoryMode.daily
              ? const SicklerChip(
                  chipType: SicklerChipType.info, label: "Taken")
              : const SizedBox(),
        ],
      ),
    );
  }
}
