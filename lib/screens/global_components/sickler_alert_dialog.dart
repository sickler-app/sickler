import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SicklerAlertDialog extends StatelessWidget {
  const SicklerAlertDialog(
      {super.key, this.actions, required this.title, this.message});
  final List<Widget>? actions;
  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AlertDialog.adaptive(
      actionsPadding: const EdgeInsets.only(
        bottom: 16,
        left: 24,
        right: 24,
        top: 0,
      ),
      surfaceTintColor: theme.scaffoldBackgroundColor,
      backgroundColor: theme.scaffoldBackgroundColor,
      actionsAlignment: MainAxisAlignment.center,
      actions: actions,
      title: Text(title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.bold)),
      content: message != null
          ? Text(
              message!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
            )
          : null,
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
