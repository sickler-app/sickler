import 'package:flutter/material.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class SuggestedDailyGoalScreen extends StatelessWidget {
  const SuggestedDailyGoalScreen({super.key});

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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                "Based on the information you submitted, we suggest you drink this much water in a day",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
          ),
          const SizedBox(height: 64),
          Text("2,000 ml",
              style: theme.textTheme.displaySmall!
                  .copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 24),
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
                  onPressed: () {},
                  label: "Change Goal",
                  showIcon: true,
                  iconPath: "assets/svg/edit.svg",
                  buttonType: SicklerButtonType.outline,
                ),
                const SizedBox(height: 16),
                SicklerButton(
                  onPressed: () {},
                  label: "Accept Goal & Continue",
                ),
              ],
            ),
          ),
          const SizedBox(height: 64)
        ],
      ),
    );
  }
}
