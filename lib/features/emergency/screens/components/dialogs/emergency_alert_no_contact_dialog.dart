import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/emergency/add_emergency_contact_screen.dart';
import 'package:sickler/screens/global_components/components.dart';

class EmergencyAlertNoContactDialog extends StatelessWidget {
  const EmergencyAlertNoContactDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    ///TODO: Wrap with BackButton Listener
    return AppAlertDialog(
      title: "Emergency Alert",
      child: Column(
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
          Text(
            "You have no emergency contacts setup at the moment",
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          AppButton(
            onPressed: () {
              context.pushNamed(AddEmergencyContactScreen.id);
            },
            label: "Add a Contact",
            buttonType: SicklerButtonType.primary,
            color: SicklerColours.white,
            backgroundColor: theme.colorScheme.error,
            icon: FluentIcons.add_24_regular,
          ),
          //  const Gap(8),
          // SicklerButton(
          //   onPressed: () {},
          //   label: "Select from phone",
          //   buttonType: SicklerButtonType.outline,
          //   color: theme.colorScheme.error,
          //   // backgroundColor: theme.colorScheme.error,
          //   icon: FluentIcons.call_24_regular,
          // ),
        ],
      ),
    );
  }
}
