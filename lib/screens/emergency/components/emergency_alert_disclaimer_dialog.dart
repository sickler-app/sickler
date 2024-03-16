import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class EmergencyAlertDisclaimerDialog extends StatelessWidget {
  const EmergencyAlertDisclaimerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SicklerAlertDialog(
      title: "Emergency Alert",
      actions: [
        SicklerButton(
          onPressed: () {},
          label: "Cancel",
          buttonType: SicklerButtonType.outline,
          color: theme.colorScheme.error,
          icon: FluentIcons.dismiss_square_24_regular,
          iconPath: "assets/svg/cross.svg",
        ),
        const Gap( 16),
        SicklerButton(
          onPressed: () {},
          label: "Continue",
          buttonType: SicklerButtonType.primary,
          color: SicklerColours.white,
          backgroundColor: theme.colorScheme.error,
          iconPath: "assets/svg/emergency.svg",
        )
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Emergency Alert would share the following information with your emergency contacts",
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap( 32),
          const Align(
            alignment: Alignment.centerLeft,
            child: AlertDetailsText(
              iconPath: "assets/svg/location.svg",
              label: "Your Location",
            ),
          ),
          const Gap( 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: AlertDetailsText(
              iconPath: "assets/svg/details.svg",
              label: "Details about your crises",
            ),
          ),
          const Gap( 32),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "Status updates and location would be shared with emergency contacts for",
                  style: theme.textTheme.bodySmall,
                ),
                TextSpan(
                  text: " 6 hours, ",
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.error),
                ),
                TextSpan(
                  text: "or until you stop sharing.",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Gap( 24),
        ],
      ),
    );
  }
}

class AlertDetailsText extends StatelessWidget {
  final String iconPath;
  final String label;
  const AlertDetailsText(
      {super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDarkMode ? SicklerColours.red20 : SicklerColours.red95,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.error, BlendMode.srcIn),
            ),
          ),
        ),
        const Gap( 16),
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
