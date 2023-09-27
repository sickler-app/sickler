import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class HistoryNextPreviousButton extends StatelessWidget {
  const HistoryNextPreviousButton(
      {super.key,
      required this.onNextPressed,
      required this.onPreviousPressed,
      required this.label});

  ///Todo: name a better widget
  ///
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Row(
      children: [
        CircleAvatar(
          backgroundColor:
              !isDarkMode ? SicklerColours.purple90 : theme.colorScheme.primary,
          child: IconButton(
              onPressed: onPreviousPressed,
              icon: SvgPicture.asset(
                "assets/svg/chevron-left.svg",
                colorFilter: ColorFilter.mode(
                    !isDarkMode
                        ? theme.iconTheme.color!
                        : SicklerColours.purple10,
                    BlendMode.srcIn),
              )),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: !isDarkMode
                ? SicklerColours.purple90
                : theme.colorScheme.primary,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                label,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: !isDarkMode
                      ? theme.iconTheme.color!
                      : SicklerColours.purple10,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor:
              !isDarkMode ? SicklerColours.purple90 : theme.colorScheme.primary,
          child: IconButton(
            onPressed: onNextPressed,
            icon: SvgPicture.asset(
              "assets/svg/chevron-right.svg",
              colorFilter: ColorFilter.mode(
                  !isDarkMode
                      ? theme.iconTheme.color!
                      : SicklerColours.purple10,
                  BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }
}
