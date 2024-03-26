import 'package:flutter/material.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class WaterEmptyScreen extends StatefulWidget {
  const WaterEmptyScreen({super.key});

  @override
  State<WaterEmptyScreen> createState() => _WaterEmptyScreenState();
}

int dailyGoal = 2000;

class _WaterEmptyScreenState extends State<WaterEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const SicklerAppBar(
            showTitle: true,
            pageTitle: "Water Intake",
            actions: [],
          ),
          const SizedBox(height: 66),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: SicklerColours.blue80,
                borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                "you do not have any water goal. Click on the button below to add a water goal.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                SicklerButton(
                  onPressed: () {},
                  label: "Accept Goal ",
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
