import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class SicklerDateSwitcher extends StatelessWidget {
  const SicklerDateSwitcher(
      {super.key,
      required this.onNextPressed,
      required this.onPreviousPressed,
      required this.label});

  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Row(
      children: [
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: isDarkMode
                ? theme.colorScheme.primary
                : SicklerColours.purple90,
            elevation: 0,
          ),
          onPressed: onPreviousPressed,
          icon: SvgPicture.asset(
            "assets/svg/chevron-left.svg",
            colorFilter: ColorFilter.mode(
                isDarkMode ? SicklerColours.purple10 : theme.iconTheme.color!,
                BlendMode.srcIn),
          ),
        ),
        const Spacer(),
        AnimatedContainer(
          duration: 300.ms,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isDarkMode
                ? theme.colorScheme.primary
                : SicklerColours.purple90,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                label,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: isDarkMode
                      ? SicklerColours.purple10
                      : theme.iconTheme.color!,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: isDarkMode
                ? theme.colorScheme.primary
                : SicklerColours.purple90,
          ),
          onPressed: onNextPressed,
          icon: SvgPicture.asset(
            "assets/svg/chevron-right.svg",
            colorFilter: ColorFilter.mode(
                isDarkMode ? SicklerColours.purple10 : theme.iconTheme.color!,
                BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}
