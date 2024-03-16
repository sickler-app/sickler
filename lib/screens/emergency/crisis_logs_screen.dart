import 'package:flutter/material.dart';
import 'package:sickler/screens/emergency/components/crisis_history_weekly.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class CrisisLogsScreen extends StatelessWidget {
  const CrisisLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SicklerAppBar(pageTitle: "Crises History"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CrisisHistoryWeekly(),
            ),
          ],
        ),
      ),
    );
  }
}
