import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/screens/emergency/components/components.dart';
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
            CrisisHistoryWeekly(),
          ],
        ),
      ),
    );
  }
}
