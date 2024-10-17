import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';

enum SnackBarMode { loading, error, success }

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarMode mode,
}) {
  Color backgroundColor = Theme.of(context).colorScheme.primary;
  Color labelColor = Colors.white;
  switch (mode) {
    case SnackBarMode.loading:
      backgroundColor = Theme.of(context).colorScheme.surfaceContainerHighest;
      labelColor = Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : AppColours.black;
    case SnackBarMode.success:
      backgroundColor = AppColours.green60;
    case SnackBarMode.error:
      backgroundColor = Theme.of(context).colorScheme.error;
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 10,
      //  dismissDirection: DismissDirection.up,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(
          horizontal: kPadding16, vertical: kPadding8),
      margin: const EdgeInsets.only(
        bottom: 32,
        left: 16,
        right: 16,
      ),
      closeIconColor: labelColor,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Visibility(
              visible: mode == SnackBarMode.loading,
              child: const CircularProgressIndicator(

                  // foregroundColor: Colors.white,
                  )),
          const Gap(kPadding16),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: labelColor),
            ),
          ),
        ],
      )));
}
