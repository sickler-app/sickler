import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';

enum ChartTimeScale { day, week, month, threeMonths, sixMonths, year, ytd }

class LineChartWidget extends StatelessWidget {
  final List<FlSpot> spots;
  final String? xUnit;
  final String? yUnit;
  final Color? color;
  final ChartTimeScale timeScale;
  final bool showFullDay;

  const LineChartWidget({
    super.key,
    required this.spots,
    this.color,
    this.xUnit,
    this.yUnit,
    this.timeScale = ChartTimeScale.day,
    this.showFullDay = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    DateTime now = DateTime.now();
    int daysInCurrentMonth = DateTime(now.year, now.month + 1, 0).day;
    double maxX;
    double minX;
    int intervalX = 1;
    double maxY = 0;

    if (spots.isNotEmpty) {
      maxY = spots.map((spot) => spot.y).toList().reduce(max);
    }

    // select the spots with the highest Y value
    double intervalY = (maxY / 2) == 0 ? 1 : maxY / 2;
    String Function(double) getXTitleText;

    switch (timeScale) {
      case ChartTimeScale.day:
        // intervalX = 6;
        // final timeFormat = DateFormat("h a"); // "6AM" format
        // getXTitleText = (value) {
        //   final time = DateTime(2022, 1, 1, value.toInt(), 0);
        //   return timeFormat.format(time);
        // };
        //
        // //Used to change the timescale of the widget
        // if (showFullDay) {
        //   minX = 0;
        //   maxX = 24;
        // } else {
        //   final sortedSpots = List<FlSpot>.from(spots)
        //     ..sort((a, b) => a.x.compareTo(b.x));
        //   if (sortedSpots.isNotEmpty) {
        //     final firstSpotHour = sortedSpots.first.x;
        //     final lastSpotHour = sortedSpots.last.x;
        //     minX = (firstSpotHour - 1).clamp(0, 23);
        //     maxX = (lastSpotHour + 1).clamp(0, 24);
        //     intervalX = ((maxX - minX) / 2).toInt();
        //   } else {
        //     minX = 0;
        //     maxX = 24;
        //   }
        // }
        final timeFormat = DateFormat("h a");

        if (showFullDay) {
          minX = 0;
          maxX = 24;
          intervalX = 6;
          getXTitleText = (value) {
            final time = DateTime(2022, 1, 1, value.toInt(), 0);
            return timeFormat.format(time);
          };
        } else {
          final sortedSpots = List<FlSpot>.from(spots)
            ..sort((a, b) => a.x.compareTo(b.x));
          if (sortedSpots.isNotEmpty) {
            minX = (sortedSpots.first.x - 1).clamp(0, 23);
            maxX = (sortedSpots.last.x + 1).clamp(0, 24);

            // Always show 3 labels
            final range = maxX - minX;
            intervalX = (range / 2).ceil();

            getXTitleText = (value) {
              if (value == minX ||
                  value == maxX ||
                  value == (minX + maxX) / 2) {
                final time = DateTime(2022, 1, 1, value.toInt(), 0);
                return timeFormat.format(time);
              }
              return '';
            };
          } else {
            minX = 0;
            maxX = 24;
            intervalX = 6;
            getXTitleText = (value) {
              final time = DateTime(2022, 1, 1, value.toInt(), 0);
              return timeFormat.format(time);
            };
          }
        }
        break;
      case ChartTimeScale.week:
        maxX = 7;
        minX = 1;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.month:
        intervalX = 1;
        minX = 1;
        maxX = daysInCurrentMonth.toDouble();
        getXTitleText = (value) {
          if (value == 1 || value == 10 || value == 20 || value == maxX) {
            return value.toInt().toString();
          }
          return '';
        };
        break;
      case ChartTimeScale.threeMonths:
        maxX = 90;
        minX = 1;
        intervalX = 30;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;

      case ChartTimeScale.sixMonths:
        maxX = 180;
        minX = 1;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
      case ChartTimeScale.year:
        maxX = DateTime.monthsPerYear.toDouble();
        minX = 1;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";

      case ChartTimeScale.ytd:
        maxX = DateTime.now().month.toDouble();
        minX = 1;
        intervalX = 1;
        getXTitleText = (value) => "${value.toInt()} ${xUnit ?? ''}";
        break;
    }

    return LineChart(
      curve: Curves.easeInOutQuart,
      LineChartData(
        gridData: const FlGridData(show: false),
        borderData: _getBorderData(isDarkMode),
        minX: minX,
        maxX: maxX,
        minY: 0,
        maxY: maxY,
        lineBarsData: [
          _getLineChartBarData(context, color, spots),
        ],
        lineTouchData: _getLineTouchData(context, color),
        titlesData: FlTitlesData(
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
                      //   color: Colors.white,
                      color: AppColours.neutral50,
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
                    //     color: Colors.white,
                    //color: theme.colorScheme.onTertiaryContainer,
                    color: AppColours.neutral50,
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
        ),
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
              isDarkMode ? AppColours.neutral20 : AppColours.neutral95,
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
      curveSmoothness: .32,
      preventCurveOverShooting: true,
      isCurved: true,
      spots: [FlSpot(spots.first.x.floorToDouble(), 0), ...spots],
      //  spots: spots, // Adds a zero spot to the earliest hour
      color: color ?? theme.colorScheme.tertiary,
      //  color: color ?? Colors.white,
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
            color?.withValues(alpha:0.4) ??
                theme.colorScheme.tertiary.withValues(alpha:0.4),
            color?.withValues(alpha:0) ?? theme.colorScheme.tertiary.withValues(alpha:0),
          ],
          //
          // colors: [
          //   Colors.white.withValues(alpha:0.4),
          //   Colors.white.withValues(alpha:0),
          // ],
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
