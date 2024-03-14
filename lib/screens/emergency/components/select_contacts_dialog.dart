import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class SelectContactsDialog extends StatelessWidget {
  const SelectContactsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SicklerAlertDialog(
      title: "Select Contacts",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap( 32),
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          Gap( 32),
          SicklerButton(
            onPressed: () {},
            label: "Send to all contacts",
            buttonType: SicklerButtonType.primary,
            color: SicklerColours.white,
            backgroundColor: theme.colorScheme.error,
            icon: FluentIcons.dismiss_24_regular,

          ),
          Gap( 12),
          SicklerButton(
            onPressed: () {},
            label: "Select Contacts",
            buttonType: SicklerButtonType.outline,
            color: theme.colorScheme.error,
            icon: FluentIcons.dismiss_24_regular,

          ),
        ],
      ),
    );
  }
}
