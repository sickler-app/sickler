import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class EmergencySelectContactsDialog extends StatelessWidget {
  const EmergencySelectContactsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SicklerAlertDialog(
      title: "Select Contacts",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.errorContainer,
            ),
          ),
          const Gap(16),
          SicklerButton(
            onPressed: () {},
            label: "Send to all contacts",
            buttonType: SicklerButtonType.primary,
            color: SicklerColours.white,
            backgroundColor: theme.colorScheme.error,
            iconPath: "assets/svg/emergency.svg",
          ),
          const Gap(12),
          SicklerButton(
            onPressed: () {},
            label: "Select Contacts",
            buttonType: SicklerButtonType.outline,
            color: theme.colorScheme.error,
          ),
        ],
      ),
    );
  }
}
