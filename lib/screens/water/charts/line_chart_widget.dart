import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

enum ChartTimeScale { day, week, month, threeMonths, sixMonths, year, ytd }

class LineChartWidget extends StatelessWidget {
  final List<FlSpot> spots;
  final String? xUnit;
  final String? yUnit;
  final Color? color;
  final ChartTimeScale timeScale;

  const LineChartWidget({
    super.key,
    required this.spots,
    this.color,
    this.xUnit,
    this.yUnit,
    this.timeScale = ChartTimeScale.day,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    DateTime now = DateTime.now();
    int daysInCurrentMonth = DateTime(now.year, now.month + 1, 0).day;
    int maxX;
    int minX;
    int intervalX;
    double maxY = spots.map((spot)=> spot.y).toList().reduce(max); // select the spots with the highest Y value
   
    double intervalY = maxY/2;
    switch (timeScale) {
      case ChartTimeScale.day:
        maxX = 24;
        minX = 0;
        break;
      case ChartTimeScale.week:
        maxX = 7;
        minX = 1;
        break;
      case ChartTimeScale.month:
        maxX = daysInCurrentMonth;
        minX = 1;
        break;
      case ChartTimeScale.threeMonths:
        maxX = 90;
        minX = 1;
        break;

      case ChartTimeScale.year:
        maxX = DateTime.monthsPerYear;
        minX = 1;

      case ChartTimeScale.ytd:
        maxX = DateTime.now().month;
        minX = 1;
        break;
      case ChartTimeScale.sixMonths:
        maxX = 180;
        minX = 1;
        break;
    }

    return LineChart(
      curve: Curves.easeInOutQuart,
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: _getTitlesData(context, intervalY),
        borderData: _getBorderData(isDarkMode),
        minX: minX.toDouble(),
        maxX: maxX.toDouble(),
        minY: 0,
        maxY: maxY,

        lineBarsData: [
          _getLineChartBarData(context, color, spots),
        ],
        lineTouchData: _getLineTouchData(context, color),
      ),
    );
  }

  FlTitlesData _getTitlesData(BuildContext context, double intervalY) {
    final theme = Theme.of(context);
    int intervalX = 1;
    String Function(double) getXTitleText;


    switch (timeScale) {
      case ChartTimeScale.day:
        intervalX = 6;
        getXTitleText = (value) => TimeOfDay(hour: value.toInt(), minute: 0,).format(context).split(":").first;
        break;
      case ChartTimeScale.week:
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.month:
        intervalX = 10;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.threeMonths:
        intervalX = 30;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.sixMonths:
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
      case ChartTimeScale.year:
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
      case ChartTimeScale.ytd:
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
    }

    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: intervalX.toDouble(),
          getTitlesWidget: (value, meta) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                getXTitleText(value),
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: SicklerColours.neutral50,
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 25,
          interval: intervalY,
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text(
              "${value.toStringAsFixed(1)} ${yUnit ?? ''}",
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 9,
                color: SicklerColours.neutral50,
              ),
            );
          },
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  FlBorderData _getBorderData(bool isDarkMode) {
    return FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(
          width: 1,
          color:
              isDarkMode ? SicklerColours.neutral20 : SicklerColours.neutral95,
        ),
      ),
    );
  }

  LineChartBarData _getLineChartBarData(
    BuildContext context,
    Color? color,
    List<FlSpot> spots,
  ) {
    final theme = Theme.of(context);
    return LineChartBarData(
      curveSmoothness: 0.4,
      preventCurveOverShooting: true,
      spots: spots.first.x != 0 ? [FlSpot.nullSpot, ...spots] : spots,
      isCurved: true,
      color: color ?? theme.colorScheme.tertiary,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 6,
            color: color ?? theme.colorScheme.tertiary,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color?.withOpacity(0.4) ??
                theme.colorScheme.tertiary.withOpacity(0.4),
            color?.withOpacity(0) ?? theme.colorScheme.tertiary.withOpacity(0),
          ],
        ),
      ),
    );
  }

  LineTouchData _getLineTouchData(BuildContext context, Color? color) {
    final theme = Theme.of(context);
    return LineTouchData(
      enabled: true,
      touchSpotThreshold: 10,
      handleBuiltInTouches: true,
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((spotIndex) {
          return TouchedSpotIndicatorData(
            const FlLine(color: Colors.transparent),
            FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 6,
                  color: color ?? theme.colorScheme.tertiary,
                  strokeWidth: 0,
                  strokeColor: color ?? theme.colorScheme.tertiary,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        tooltipRoundedRadius: 32,
        getTooltipColor: (LineBarSpot barSpot) {
          return color ?? theme.colorScheme.tertiary;
        },
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map((barSpot) {
            return LineTooltipItem(
              "${(barSpot.y).toStringAsFixed(1)} ${yUnit ?? ''}",
              theme.textTheme.bodySmall!.copyWith(color: Colors.white),
            );
          }).toList();
        },
      ),
    );
  }
}
