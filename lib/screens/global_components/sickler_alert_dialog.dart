import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SicklerAlertDialog extends StatelessWidget {
  const SicklerAlertDialog(
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
              .copyWith(fontWeight: FontWeight.w800)),
      content: message != null
          ? Text(
              message!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
            )
          : child,
    )
        .animate()
        .slideY(
          curve: Curves.easeOut,
          duration: 200.ms,
          begin: .1,
          end: 0,
        )
        .fadeIn(
          //delay: 300.ms,
          curve: Curves.easeOut,
          duration: 150.ms,
        );
  }
}
