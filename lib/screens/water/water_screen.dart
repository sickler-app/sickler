import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/enums.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/water/components/water_volume_selector.dart';

import '../global_components/sickler_circular_percent_indicator.dart';
import 'components/components.dart';

class WaterScreen extends StatefulWidget {
  static const String id = "water";
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

int dailyGoal = 2000;

class _WaterScreenState extends State<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SicklerAppBar(pageTitle: "Water Intake"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      SicklerCircularPercentIndicator(
                        value: 37.toString(),
                        shouldAnimate: true,
                        unit: "%",
                        progress: 0.37,

                      ),
                      const Gap(16),
                      Text("$dailyGoal ml",
                          style: theme.textTheme.displaySmall!
                              .copyWith(fontWeight: FontWeight.w800)),
                      const Gap(16),
                      Text("remaining $dailyGoal ml",
                          style: theme.textTheme.bodyMedium),
                      const Gap(24),
                      Text(
                          "Looking great! Log your water intake and hit that water goal ",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),

                  const Gap(16),
                  WaterVolumeSelector(selectedVolume: (double? selectedVolume) {
                    ///Todo: Add selected Medication to state
                  }),
                  Text("Statistics", style: theme.textTheme.headlineSmall),
                  const Gap(16),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        unselectedColor: SicklerColours.blueSeed,
                        unselectedBackgroundColor: SicklerColours.blueSeed,
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        label: "Daily",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        label: "Weekly",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        label: "Monthly",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        label: "Yearly",
                      ),
                      SicklerChip(
                        onSelected: (value) async {
                          /// Select Dose Bottom Sheet
                          await showModalBottomSheet(
                            context: context,
                            builder: (context) => SicklerBottomSheet(
                              title: "Select Dose",
                              onPressed: () {
                                ///Todo: pop and add dose to state
                              },
                              child: SicklerListWheelScrollViewPicker(
                                primaryInitialValue: 50,
                                primaryFinalValue: 1000,
                                primaryValueInterval: 50,
                                primaryUnitLabels: const ["mg"],
                                scrollViewToLabelPadding: 24,
                                onSelectedItemChanged: (selectedValue) {
                                  ///Todo: update selected value
                                },
                              ),
                            ),
                          );
                        },
                        chipType: SicklerChipType.filter,
                        label: "Custom",
                      ),
                    ],
                  ),
                  const Gap(24),
                  Text(" Weekly Average ", style: theme.textTheme.bodyMedium),
                  const Gap(16),
                  Text("$dailyGoal ml",
                      style: theme.textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w800)),
                  const Gap(24),

                  const WaterStatistics(),
                  const Gap(24),
                  Text("Today's Logs",
                      style: theme.textTheme.titleLarge),
                  const Gap(16),
                  const TodaysLog(),
                  const Gap(64)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
