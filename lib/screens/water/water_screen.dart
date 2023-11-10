import 'package:flutter/material.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/enums.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/global_components/sickler_app_bar.dart';
import 'package:sickler/screens/meds/components/components.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SicklerAppBar(pageTitle: "Water Intake"),

          Expanded(child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
            child: SicklerCircularPercentIndicator(
              value: 37.toString(),
              animate: true,
              unit: "%",
              progress: 1.0,
            ),
          ),
          const SizedBox(height: 10),
      Center(
        child: Text("$dailyGoal ml",
            style: theme.textTheme.displaySmall!
                .copyWith(fontWeight: FontWeight.w800)),
      ),
              const SizedBox(height: 10),
              
      Center(
        child: Text(" remaining $dailyGoal ml",
            style: theme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.w400)),
      ),
               const SizedBox(height: 34),
              Center(
                child: Text(" Looking great! Log your water intake ",
                            style: theme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.w400)),
              ),
              Center(
                child: Text(" and hit that water goal ",
                            style: theme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.w400)),
              ),
                   const SizedBox(height: 10),
                  WaterVolumeSelector(selectedVolume:
                    (VolumeType selectedVolumeType) {
                  ///Todo: Add selected Medication to state
                }),

      Text("Statistics",
          style: theme.textTheme.displaySmall!
              .copyWith(fontWeight: FontWeight.w400)),
              const SizedBox(height: 10),

                 Wrap(
                  direction: Axis.horizontal,
                  spacing: 12,
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
                const SizedBox(height: 34),
                  Text(" Weekly Average ",
                          style: theme.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.w400)),
              const SizedBox(height: 14),

                Text("$dailyGoal ml",
                    style: theme.textTheme.displaySmall!
                        .copyWith(fontWeight: FontWeight.w800)),
               const SizedBox(height: 34),
                 
               Container(
                decoration: BoxDecoration(
                   color: SicklerColours.blueSeed.withOpacity(0.08),
          borderRadius: BorderRadius.circular(32)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                       const SizedBox(height: 10),
                       WaterHistoryNextPreviousButton(
                        
                        onNextPressed: () {},
                        onPreviousPressed: () {},
                        label: "Today"),
                
                      BarChartSample3()
                    ],
                  ),
                ),
               ),
               const SizedBox(height: 10),
               Text("Today's Logs",
          style: theme.textTheme.displaySmall!
              .copyWith(fontWeight: FontWeight.w400)),
             const SizedBox(height: 20),

               TodaysLog()
            
              ],
            ),
          ))
        ],
        
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
              HistoryNextPreviousButton(
                      onNextPressed: () {},
                      onPreviousPressed: () {},
                      label: "Today"),
           
            ],
          ),
         
          const BarChartSample3()
        ],
      ),
    );
  }
}