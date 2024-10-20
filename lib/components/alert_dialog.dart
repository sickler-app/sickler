import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog(
      {super.key, this.actions, required this.title, this.message, this.child});
  final List<Widget>? actions;
  final String title;
  final String? message;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null && message != null) {
      throw ErrorHint(
          "Cannot have both 'child' and `message` parameters simultaneously, consider removing one");
    }
    final ThemeData theme = Theme.of(context);
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16),
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.scaffoldBackgroundColor,
      scrollable: false,
      title: Text(title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.w700)),
      content: message != null
          ? Text(
              message!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
            )
          : child,
    )
        .animate()
        .moveY(
            duration: 800.ms, begin: 120, end: 0, curve: Curves.easeInOutQuart)
        .fadeIn(
          delay: 300.ms,
          duration: 500.ms,
        );
  }
}
