import 'package:flutter/material.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/water/components/water_bar_chart.dart';

import '../../../core/core.dart';

class WaterStatistics extends StatelessWidget {
  const WaterStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: SicklerColours.blueSeed.withOpacity(0.08),
          borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: [
          SicklerDateSwitcher(
              color: SicklerColours.blue20,
              backgroundColor: SicklerColours.blue90,

              onNextPressed: (){}, onPreviousPressed: (){}, label: "Today Two"),
          const WaterBarChart(),
        ],
      ),
    );
  }
}

