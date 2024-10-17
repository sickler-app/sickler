import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/components.dart';
import '../profile.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = "settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(pageTitle: "Settings"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///---------------Water preferences Section--------------///

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Water Preferences",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const Gap(16),
                SettingsListItem(
                  label: "Edit water goal",
                  icon: FluentIcons.edit_24_regular,
                  onPressed: () {},
                ),
                SettingsListItem(
                  label: "Delete water goal",
                  icon: FluentIcons.delete_24_regular,
                  onPressed: () {},
                ),
                SettingsListItem(
                  showBorder: false,
                  label: "Define custom input volume",
                  icon: FluentIcons.drink_bottle_32_regular,
                  onPressed: () {},
                ),

                const Gap(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Units",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),

                ///---------------Units Section--------------///
                const Gap(8),
                SettingsListItem(
                  label: "Height",
                  iconPath: "assets/svg/ruler.svg",
                  onPressed: () {},
                  trailingWidget: Text(
                    "cm",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.primary),
                  ),
                ),
                SettingsListItem(
                  label: "Weight",
                  iconPath: "assets/svg/weight.svg",
                  onPressed: () {},
                  trailingWidget: Text(
                    "Kg",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.primary),
                  ),
                ),
                SettingsListItem(
                  showBorder: false,
                  label: "Distance",
                  iconPath: "assets/svg/distance.svg",
                  onPressed: () {},
                  trailingWidget: Text(
                    "Km",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.primary),
                  ),
                ),
                const Gap(24),

                ///---------------Dark Mode Preferences Section--------------///
                SettingsListItem(
                  showBorder: false,
                  label: "Dark Theme",
                  icon: FluentIcons.weather_moon_24_regular,
                  onPressed: () {},
                  trailingWidget: Switch(
                    value: false,
                    onChanged: (value) {
                      ///Todo: Save Theme Preferences
                    },
                  ),
                ),

                ///---------------Profile Settings--------------///
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Profile Settings",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const Gap(16),
                SettingsListItem(
                  label: "Edit Profile",
                  icon: FluentIcons.person_24_regular,
                  onPressed: () {},
                ),
                SettingsListItem(
                  label: "Log Out",
                  icon: FluentIcons.arrow_exit_20_regular,
                  onPressed: () {},
                ),
                SettingsListItem(
                  showBorder: false,
                  color: theme.colorScheme.error,
                  label: "Delete Profile",
                  icon: FluentIcons.delete_24_regular,
                  onPressed: () {},
                  trailingWidget: const SizedBox.shrink(),
                ),
                const Gap(64),
              ],
            )
          ],
        ),
      ),
    );
  }
}
