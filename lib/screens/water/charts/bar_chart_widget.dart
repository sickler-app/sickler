import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final Color? color;

  const BarChartWidget(
      {super.key,
      required this.barGroups,
      this.color = SicklerColours.blueSeed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return BarChart(
      //Todo: Customise the bar chart
      swapAnimationCurve: Curves.easeInOutQuart,
      BarChartData(
          barGroups: barGroups,
          minY: 0,
          borderData: FlBorderData(
              show: true,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: isDarkMode
                          ? SicklerColours.neutral20
                          : SicklerColours.neutral95))),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    String horizontalLabel;
                    switch (value.toInt()) {
                      case 1:
                        horizontalLabel = 'M';
                        break;
                      case 2:
                        horizontalLabel = 'T';
                        break;
                      case 3:
                        horizontalLabel = 'W';
                        break;
                      case 4:
                        horizontalLabel = 'T';
                        break;
                      case 5:
                        horizontalLabel = 'F';
                        break;
                      case 6:
                        horizontalLabel = 'S';
                        break;
                      case 7:
                        horizontalLabel = 'S';
                        break;
                      default:
                        horizontalLabel = 'S';
                        break;
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        horizontalLabel,
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 10, color: SicklerColours.neutral50),
                      ),
                    );
                  }),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  reservedSize: 30,
                  interval: 5000,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      "${(value / 1000).toStringAsFixed(1)} L",
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 9, color: SicklerColours.neutral50),
                    );
                  }),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipRoundedRadius: 32,
              getTooltipColor: (BarChartGroupData barGroup) {
                return color ?? theme.colorScheme.tertiary;
              },
              getTooltipItem: (groupData, index, rodData, indexx) {
                return BarTooltipItem(
                    '${(rodData.toY / 1000).toStringAsFixed(2)} L',
                    theme.textTheme.bodySmall!.copyWith(color: Colors.white));
              },
            ),
          )),
    );
  }
}
