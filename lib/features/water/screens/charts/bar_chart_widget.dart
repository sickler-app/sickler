import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import 'line_chart_widget.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final ChartTimeScale timeScale;
  final String? xUnit;
  final String? yUnit;
  final Color? color;

  const BarChartWidget(
      {super.key,
      required this.barGroups,
      this.color = AppColours.blueSeed,
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
    // double minX;
    double intervalX;
    double maxY = barGroups
        .map((barGroups) => barGroups.barRods[0].toY)
        .toList()
        .reduce(max);
    double intervalY = (maxY / 2) == 0 ? 1 : maxY / 2;

    String Function(double) getXTitleText;

    switch (timeScale) {
      case ChartTimeScale.day:
        maxX = 24;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.week:
        maxX = 7;
        intervalX = 1;
        getXTitleText = (value) {
          switch ((value.toInt() + 1)) {
            case 1:
              return 'M';

            case 2:
              return 'T';

            case 3:
              return 'W';

            case 4:
              return 'T';

            case 5:
              return 'F';

            case 6:
              return 'S';

            case 7:
              return 'S';

            default:
              return 'S';
          }
        };

        break;
      case ChartTimeScale.month:
        intervalX = 1;
        // minX = 1;
        maxX = daysInCurrentMonth.toDouble();
        getXTitleText = (value) {
          if (value == 1 || value == 10 || value == 20 || value == maxX) {
            return value.toInt().toString();
          }
          return '';
        };

      case ChartTimeScale.threeMonths:
        maxX = 3;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.year:
        maxX = 12;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.ytd:
        maxX = now.month.toDouble();
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.sixMonths:
        maxX = 6;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
    }
    return BarChart(
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
                          ? AppColours.neutral20
                          : AppColours.neutral95))),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  interval: intervalX,
                  getTitlesWidget: (value, meta) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        getXTitleText(value),
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 10, color: AppColours.neutral50),
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
                          fontSize: 9, color: AppColours.neutral50),
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
                    '${(rodData.toY).toStringAsFixed(2)} ${yUnit ?? 'L'}',
                    theme.textTheme.bodySmall!.copyWith(color: Colors.white));
              },
            ),
          )),
    );
  }
}
