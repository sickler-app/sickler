import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DateSwitcher extends StatelessWidget {
  const DateSwitcher(
      {super.key,
      required this.onNextPressed,
      required this.onPreviousPressed,
      required this.label,
      this.backgroundColor,
      this.color});

  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final String label;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Row(
      children: [
        IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: isDarkMode
                  ? backgroundColor ?? theme.colorScheme.primary
                  : backgroundColor ?? theme.colorScheme.primaryContainer,
              elevation: 0,
            ),
            onPressed: onPreviousPressed,
            icon: Icon(
              FluentIcons.chevron_left_24_regular,
              color: color ?? theme.iconTheme.color,
            )),
        const Spacer(),
        AnimatedContainer(
          duration: 300.ms,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isDarkMode
                ? backgroundColor ?? theme.colorScheme.primary
                : backgroundColor ?? theme.colorScheme.primaryContainer,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                label,
                style: theme.textTheme.bodyMedium!.copyWith(color: color),
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: isDarkMode
                  ? backgroundColor ?? theme.colorScheme.primary
                  : backgroundColor ?? theme.colorScheme.primaryContainer,
            ),
            onPressed: onNextPressed,
            icon: Icon(
              FluentIcons.chevron_right_24_regular,
              color: color,
            ))
      ],
    );
  }
}
