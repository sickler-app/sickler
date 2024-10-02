import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';
import 'package:sickler/screens/profile/profile_vitals_info_screen.dart';
import 'package:sickler/screens/water/water_screen.dart';

import 'components/components.dart';

class ProfileScreen extends ConsumerWidget {
  static const String id = "profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.colorScheme.brightness == Brightness.dark;
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SicklerAppBar(pageTitle: "Profile"),
              SicklerEditableAvatar(
                  onEditPressed: () {
                    context.pushNamed(ProfileBasicInfoScreen.id);
                  },
                  imagePath: "assets/images/memoji2.jpg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(16),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Amelia",
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                                text: " Robertson",
                                style: theme.textTheme.bodyMedium)
                          ],
                        ),
                      ),
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserInfoChip(
                          label: "21 Yrs",
                          icon: FluentIcons.food_cake_20_regular,
                          backgroundColor: isDarkMode
                              ? theme.colorScheme.primary
                              : theme.colorScheme.primaryContainer,
                          color: isDarkMode
                              ? Colors.white
                              : theme.colorScheme.onPrimaryContainer,
                        ),
                        const Gap(8),
                        UserInfoChip(
                          label: "Female",
                          icon: FluentIcons.person_20_regular,
                          color: isDarkMode
                              ? Colors.white
                              : SicklerColours.orange60,
                          backgroundColor: isDarkMode
                              ? theme.colorScheme.secondary
                              : theme.colorScheme.secondaryContainer,
                        ),
                        const Gap(8),
                        UserInfoChip(
                          label: "AS",
                          iconPath: "assets/svg/dna.svg",
                          color: isDarkMode
                              ? Colors.white
                              : SicklerColours.green30,
                          backgroundColor: isDarkMode
                              ? SicklerColours.green60
                              : SicklerColours.green95,
                        ),
                      ],
                    ),
                    const Gap(16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: isDarkMode
                              ? theme.cardColor
                              : theme.colorScheme.secondaryContainer),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                                  "Your water intake looks good, Goof Job!")),
                          const Gap(16),
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDarkMode
                                    ? SicklerColours.neutral30
                                    : SicklerColours.orange90),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    Row(
                      children: [
                        Text("Vitals", style: theme.textTheme.headlineSmall),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            context.pushNamed(ProfileVitalsInfoScreen.id);

                            ///Todo: Add Edit Vitals Method
                          },
                          icon: Icon(
                            FluentIcons.edit_24_regular,
                            color: theme.colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Expanded(
                          child: VitalsItemCard(
                            onPressed: () {
                              context.pushNamed(ProfileVitalsInfoScreen.id);
                            },
                            label: "Height",
                            value: "178",
                            unit: " cm",
                            color: isDarkMode
                                ? Colors.white
                                : theme.colorScheme.primary,
                            backgroundColor: isDarkMode
                                ? theme.colorScheme.primary
                                : theme.cardColor,
                            icon: Transform.rotate(
                              angle: 0.789,

                              /// = 45 deg in radians
                              child: Icon(
                                FluentIcons.ruler_24_regular,
                                color: isDarkMode
                                    ? Colors.white
                                    : theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: VitalsItemCard(
                            onPressed: () {
                              context.pushNamed(ProfileVitalsInfoScreen.id);
                            },
                            label: "Weight",
                            value: "64",
                            unit: " kg",
                            color: isDarkMode
                                ? Colors.white
                                : theme.colorScheme.error,
                            backgroundColor: isDarkMode
                                ? theme.colorScheme.error
                                : theme.colorScheme.errorContainer,
                            icon: SvgPicture.asset(
                              "assets/svg/weight.svg",
                              colorFilter: ColorFilter.mode(
                                  isDarkMode
                                      ? Colors.white
                                      : theme.colorScheme.error,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: VitalsItemCard(
                            onPressed: () {
                              context.pushNamed(WaterScreen.id);
                            },
                            label: "Water",
                            value: "1200",
                            unit: " ml",
                            backgroundColor: isDarkMode
                                ? theme.colorScheme.tertiary
                                : SicklerColours.blue95,
                            color: isDarkMode
                                ? Colors.white
                                : theme.colorScheme.tertiary,
                            icon: SvgPicture.asset(
                              "assets/svg/droplet-alt.svg",
                              colorFilter: ColorFilter.mode(
                                  isDarkMode
                                      ? Colors.white
                                      : theme.colorScheme.tertiary,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: VitalsItemCard(
                            onPressed: () {},
                            label: "BMI",
                            value: "19.8",
                            // unit: " normal",
                            color: isDarkMode
                                ? Colors.white
                                : theme.colorScheme.secondary,
                            backgroundColor: isDarkMode
                                ? theme.colorScheme.secondary
                                : theme.colorScheme.secondaryContainer,
                            icon: SvgPicture.asset(
                              "assets/svg/dna.svg",
                              colorFilter: ColorFilter.mode(
                                  isDarkMode
                                      ? Colors.white
                                      : theme.colorScheme.secondary,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    Row(
                      children: [
                        Text(
                          "Allergies",
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ///Todo: Add Add Allergies Method
                          },
                          icon: Icon(
                            FluentIcons.add_24_regular,
                            color: theme.colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                    const Wrap(
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      spacing: 8,
                      runSpacing: -4,
                      children: [
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Peanuts"),
                        SicklerChip(
                            chipType: SicklerChipType.info,
                            label: "Groundnuts"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Text(
                          "Medical Conditions",
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ///Todo: Add Medical Condtions Method
                          },
                          icon: Icon(
                            FluentIcons.add_24_regular,
                            color: theme.colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                    const Wrap(
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      spacing: 8,
                      runSpacing: -4,
                      children: [
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Peanuts"),
                        SicklerChip(
                            chipType: SicklerChipType.info,
                            label: "Groundnuts"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                        SicklerChip(
                            chipType: SicklerChipType.info, label: "Mango"),
                      ],
                    ),
                    const Gap(64),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
