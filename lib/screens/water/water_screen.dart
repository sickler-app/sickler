import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/enums.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/water/todays_log.dart';
import 'package:sickler/screens/water/water_chart.dart';
import 'package:sickler/screens/water/water_next_button.dart';
import 'package:sickler/screens/water/water_volume_selector.dart';

import '../global_components/sickler_circular_percent_indicator.dart';

class WaterScreen extends StatefulWidget {
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
                   Gap( 16),
                   Text("$dailyGoal ml",
                       style: theme.textTheme.displaySmall!
                           .copyWith(fontWeight: FontWeight.w800)),
                   Gap( 16),
                   Text(" remaining $dailyGoal ml",
                       style: theme.textTheme.bodyMedium),
                   Gap( 24),
                   Text(" Looking great! Log your water intake and hit that water goal ",
                       textAlign: TextAlign.center,
                       style: theme.textTheme.bodyMedium),

                 ],
               )
               ,

        
               Gap( 16),
                WaterVolumeSelector(
                    selectedVolume: (VolumeType selectedVolumeType) {
                      ///Todo: Add selected Medication to state
                    }),
                Text("Statistics",
                    style: theme.textTheme.headlineSmall),
               Gap( 16),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    SicklerChip(
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
               Gap( 24),
                Text(" Weekly Average ",
                    style: theme.textTheme.bodyMedium),
               Gap( 16),
                Text("$dailyGoal ml",
                    style: theme.textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.w800)),
               Gap( 24),
                Container(
                  decoration: BoxDecoration(
                      color: SicklerColours.blueSeed.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(32)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Gap( 10),
                      WaterHistoryNextPreviousButton(
                          onNextPressed: () {},
                          onPreviousPressed: () {},
                          label: "Today"),
                      const BarChartSample3()
                    ],
                  ),
                ),
               Gap( 10),
                Text("Today's Logs",
                    style: theme.textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.w400)),
               Gap( 20),
                TodaysLog()
              ],),
            )
        
          ],
        ),
      ),
    );
  }

  Widget _statsWidget() {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        chatWidget(),
      ],
    );
  }

  Widget chatWidget() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: SicklerColours.blueSeed.withOpacity(0.08),
          borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // NextPreviousButton(
              //     onNextPressed: () {},
              //     onPreviousPressed: () {},
              //     label: "Today"),
            ],
          ),
          const BarChartSample3()
        ],
      ),
    );
  }
}
