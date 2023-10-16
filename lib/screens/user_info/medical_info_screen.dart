import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';
import '../global_components/global_components.dart';

class MedicalInfoScreen extends StatefulWidget {
  const MedicalInfoScreen({super.key});

  @override
  State<MedicalInfoScreen> createState() => _MedicalInfoScreenState();
}

class _MedicalInfoScreenState extends State<MedicalInfoScreen> {
  bool labelSelected = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SicklerAppBar(
              pageTitle: "Medical\nInfo",
              actions: [
                SicklerChipButton(
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
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  Text(
                    "Pain Severity?",
                    style: theme.textTheme.bodyMedium,
                  ),

                  ///Todo: Make a Sickler Slider component
                  Slider(min: 0, max: 10, value: 7, onChanged: (value) {}),
                  const SizedBox(height: 24),
                  Text(
                    "Allergies",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),

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
                              theme.brightness == Brightness.light
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 24),
                  Text(
                    "Medical Conditions",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),

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
                              theme.brightness == Brightness.light
                                  ? theme.colorScheme.primary
                                  : theme.iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 32),
                  SicklerButton(onPressed: () {}, label: "Continue"),
                  const SizedBox(
                    height: 64,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
