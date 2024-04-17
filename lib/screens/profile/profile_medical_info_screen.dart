import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';
import '../global_components/global_components.dart';

class ProfileMedicalInfoScreen extends StatefulWidget {
  static const String id = "medical_info";
  const ProfileMedicalInfoScreen({super.key});

  @override
  State<ProfileMedicalInfoScreen> createState() =>
      _ProfileMedicalInfoScreenState();
}

class _ProfileMedicalInfoScreenState extends State<ProfileMedicalInfoScreen> {
  bool labelSelected = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SicklerAppBar(
              pageTitle: "Medical\nInfo",
              actions: [
                SicklerButton(
                  isChipButton: true,
                  onPressed: () {
                    //Todo: Skip Page
                  },
                  label: "Skip",
                  buttonType: SicklerButtonType.text,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Crises frequency",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(16),
                  Text(
                    "How often do you experience a Sickle Cell crises?",
                    style: theme.textTheme.bodyMedium,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        label: "Daily",
                        onSelected: (value) {},
                      ),
                      SicklerChip(
                        label: "Weekly",
                        onSelected: (value) {},
                      ),
                      SicklerChip(
                        label: "Monthly",
                        onSelected: (value) {},
                      ),
                      SicklerChip(
                        label: "Custom",
                        onSelected: (value) {},
                      ),
                    ],
                  ),
                  const Gap(16),
                  Text(
                    "Pain Severity?",
                    style: theme.textTheme.bodyMedium,
                  ),

                  ///Todo: Make a Sickler Slider component
                  Slider(min: 0, max: 10, value: 7, onChanged: (value) {}),
                  const Gap(24),
                  Text(
                    "Allergies",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(12),

                  TextFormField(
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "e.g. Peanuts",
                      suffixIcon: IconButton(
                        onPressed: () {
                          ///Todo: add to list of allergies
                        },
                        icon: SvgPicture.asset(
                          "assets/svg/check.svg",
                          colorFilter: ColorFilter.mode(
                              !isDarkMode
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        chipType: SicklerChipType.info,
                        label: "Peanuts",
                      ),
                      SicklerChip(
                        chipType: SicklerChipType.info,
                        label: "Bees",
                      ),
                      SicklerChip(
                        chipType: SicklerChipType.info,
                        label: "Dogs",
                      ),
                    ],
                  ),
                  const Gap(24),
                  Text(
                    "Medical Conditions",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(12),

                  TextFormField(
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "e.g. Acute Chest Syndrome",
                      suffixIcon: IconButton(
                        onPressed: () {
                          ///Todo: add to list of medical conditions
                        },
                        icon: SvgPicture.asset(
                          "assets/svg/check.svg",
                          colorFilter: ColorFilter.mode(
                              !isDarkMode
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        chipType: SicklerChipType.info,
                        label: "Aneamia",
                      ),
                      SicklerChip(
                        chipType: SicklerChipType.info,
                        label: "Cold",
                      ),
                    ],
                  ),
                  const Gap(32),
                  SicklerButton(onPressed: () {}, label: "Continue"),
                  const Gap(64)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
