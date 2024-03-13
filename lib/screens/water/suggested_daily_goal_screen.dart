import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class SuggestedDailyGoalScreen extends StatefulWidget {
  const SuggestedDailyGoalScreen({super.key});

  @override
  State<SuggestedDailyGoalScreen> createState() =>
      _SuggestedDailyGoalScreenState();
}

int dailyGoal = 2000;

class _SuggestedDailyGoalScreenState extends State<SuggestedDailyGoalScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SicklerAppBar(
            showTitle: false,
            pageTitle: "Your daily goal",
            actions: [
              SicklerChipButton(
                  onPressed: () {},
                  label: "Skip",
                  buttonType: SicklerButtonType.text),
            ],
          ),
          Text(
            "Your daily goal",
            style: theme.textTheme.displaySmall,
          ),
          Gap( 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                "Based on the information you submitted, we suggest you drink this much water in a day",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
          ),
          Gap( 64),
          Text("$dailyGoal ml",
              style: theme.textTheme.displaySmall!
                  .copyWith(fontWeight: FontWeight.w800)),
          Gap( 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                "We’ll remind you periodically to drink, you can also change your reminder preferences here.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SicklerButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => SicklerBottomSheet(
                        title: "Select Volume",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SicklerListWheelScrollViewPicker(
                          primaryInitialValue: 1000,
                          primaryFinalValue: 5000,
                          primaryValueInterval: 100,
                          primaryUnitLabels: const ["ml"],
                          onSelectedItemChanged: (selectedValue) {
                            /// Todo: change daily goal to selected volume

                            setState(() {
                              dailyGoal = selectedValue;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  label: "Change Goal",
                  showIcon: true,
                  iconPath: "assets/svg/edit.svg",
                  buttonType: SicklerButtonType.outline,
                ),
                Gap( 16),
                SicklerButton(
                  onPressed: () {},
                  label: "Accept Goal & Continue",
                ),
              ],
            ),
          ),
          Gap( 64)
        ],
      ),
    );
  }
}
