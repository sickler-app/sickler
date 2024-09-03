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
    int maxX;
    int minX;
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
        maxX = 30;
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
        gridData: FlGridData(show: false),
        titlesData: _getTitlesData(context, isDarkMode),
        borderData: _getBorderData(isDarkMode),
        minX: minX.toDouble(),
        maxX: maxX.toDouble(),
        minY: 0,
        lineBarsData: [
          _getLineChartBarData(context, color, spots),
        ],
        lineTouchData: _getLineTouchData(context, color),
      ),
    );
  }

  FlTitlesData _getTitlesData(BuildContext context, bool isDarkMode) {
    final theme = Theme.of(context);
    int interval = 1;
    String Function(double) getXTitleText;

    switch (timeScale) {
      case ChartTimeScale.day:
        interval = 6;
        getXTitleText = (value) => "${value.toStringAsFixed(0)} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.week:
        interval = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.month:
        interval = 10;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.threeMonths:
        interval = 30;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.sixMonths:
        interval = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
      case ChartTimeScale.year:
        interval = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
      case ChartTimeScale.ytd:
        interval = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
    }

    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: interval.toDouble(),
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
          reservedSize: 30,
          interval: 5,
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text(
              "${value.toStringAsFixed(0)} ${yUnit ?? ''}",
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 9,
                color: SicklerColours.neutral50,
              ),
            );
          },
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
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
            FlLine(color: Colors.transparent),
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
