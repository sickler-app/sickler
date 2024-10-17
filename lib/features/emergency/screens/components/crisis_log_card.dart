import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class CrisisLogCard extends StatefulWidget {
  const CrisisLogCard({super.key});

  @override
  State<CrisisLogCard> createState() => _CrisisEventLogCardState();
}

class _CrisisEventLogCardState extends State<CrisisLogCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return AnimatedContainer(
      height: isExpanded ? 202 : 106,
      duration: 250.ms,
      curve: Curves.easeInOut,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: isDarkMode
            ? null
            : Border.all(
                color: (isExpanded
                    ? Colors.transparent
                    : theme.colorScheme.primaryContainer),
                width: 1),
        color: isDarkMode
            ? theme.cardColor
            : (isExpanded ? theme.cardColor : Colors.transparent),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Crises Event",
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: const Icon(FluentIcons.chevron_down_24_regular)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "7",
                style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary),
              ),
              Text(
                " - Extreme pain",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: AppColours.neutral50),
              ),
              const Spacer(),
              Text(
                "12:07 pm",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Gap(16),
          Visibility(
            visible: isExpanded,
            child: Column(
              children: [
                const Text(
                    "Description, if any, for example, pain felt, on lowe back and chest"),
                const Gap(8),
                Row(
                  children: [
                    const Spacer(),
                    IconButton.filled(
                        style: IconButton.styleFrom(
                            elevation: 0,
                            backgroundColor: theme.colorScheme.error),
                        onPressed: () {},
                        icon: const Icon(
                          FluentIcons.delete_20_regular,
                          color: Colors.white,
                        )),
                    // const Gap(4),
                    IconButton.filled(
                        style: IconButton.styleFrom(
                            splashFactory: InkSparkle.splashFactory,
                            elevation: 0,
                            backgroundColor: theme.colorScheme.primary),
                        onPressed: () {},
                        icon: const Icon(FluentIcons.edit_20_regular,
                            color: Colors.white)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
