import 'package:flutter/material.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/water/components/water_bar_chart.dart';

import '../../../core/core.dart';

class WaterStatistics extends StatelessWidget {
  const WaterStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: isDarkMode ? theme.cardColor : SicklerColours.blue95,
          borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: [
          SicklerDateSwitcher(
              color: isDarkMode ? theme.iconTheme.color : SicklerColours.blue20,
              backgroundColor:
                  isDarkMode ? SicklerColours.neutral30 : SicklerColours.blue90,
              onNextPressed: () {},
              onPreviousPressed: () {},
              label: "Today Two"),
          const WaterBarChart(),
        ],
      ),
    );
  }
}
