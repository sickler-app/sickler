import 'package:flutter/material.dart';
import 'package:sickler/screens/emergency/components/crisis_history_monthly.dart';
import 'package:sickler/screens/global_components/components.dart';

class CrisisLogsScreen extends StatelessWidget {
  static const String id = "crisis_logs";
  const CrisisLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(pageTitle: "Crises History"),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: CrisisHistoryWeekly(),
            // ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CrisisHistoryMonthly()),
          ],
        ),
      ),
    );
  }
}
