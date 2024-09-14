import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sickler/screens/water/charts/line_chart_widget.dart';

import '../../../core/core.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final ChartTimeScale timeScale;
  final String? xUnit;
  final String? yUnit;
  final Color? color;

  const BarChartWidget(
      {super.key,
      required this.barGroups,
      this.color = SicklerColours.blueSeed,
      required this.timeScale,
      this.xUnit,
      this.yUnit});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    DateTime now = DateTime.now();
    int daysInCurrentMonth = DateTime(now.year, now.month + 1, 0).day;


    double maxX;
    double minX;
    double intervalX;
    double maxY = barGroups.map((barGroups) => barGroups.barRods[0].toY).toList().reduce(max);
    double intervalY = maxY/2;

    switch (timeScale) {
      case ChartTimeScale.day:
        maxX = 24;
        intervalX = 0;
        break;
      case ChartTimeScale.week:
        maxX = 7;
        intervalX = 1;
        break;
      case ChartTimeScale.month:
        maxX = daysInCurrentMonth.toDouble();
        intervalX = 10;
        break;
      case ChartTimeScale.threeMonths:
        maxX = 3;
        intervalX = 1;
        break;
      case ChartTimeScale.year:
        maxX = 12;
        intervalX = 1;
        break;
      case ChartTimeScale.ytd:
        maxX = now.month.toDouble();
        intervalX = 1;
        break;
      case ChartTimeScale.sixMonths:
        maxX = 6;
        intervalX = 1;
        break;
      default:
        maxX = 24;
        intervalX = 0;
    }
    return BarChart(
      //Todo: Customise the bar chart
      swapAnimationCurve: Curves.easeInOutQuart,
      BarChartData(
          barGroups: barGroups,
          minY: 0,
          maxY: maxY,
          borderData: FlBorderData(
              show: true,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: isDarkMode
                          ? SicklerColours.neutral20
                          : SicklerColours.neutral95))),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                //  interval: intervalX,
                  getTitlesWidget: (value, meta) {
                    String horizontalLabel = (value.toInt() + 1).toString();

                    if (timeScale == ChartTimeScale.month) {
                      if (value % 9 != 0) {
                        return const SizedBox();
                      }
                    }

                    if (timeScale == ChartTimeScale.week) {
                      switch ((value.toInt() + 1)) {
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
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
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
                interval: intervalY,
                  reservedSize: 25,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      "${(value).toStringAsFixed(1)} ${yUnit ?? ''}",
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 9, color: SicklerColours.neutral50),
                    );
                  }),
            ),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                    '${(rodData.toY / 1000).toStringAsFixed(3)} ${yUnit ?? ''}',
                    theme.textTheme.bodySmall!.copyWith(color: Colors.white));
              },
            ),
          )),
    );
  }
}
