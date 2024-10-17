import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../water.dart';


class WaterStatistics extends ConsumerWidget {
  const WaterStatistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8, right: 16),
      decoration: BoxDecoration(
          color: isDarkMode ? theme.cardColor : AppColours.blue95,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          DateSwitcher(
              color: isDarkMode ? theme.iconTheme.color : AppColours.blue20,
              backgroundColor:
                  isDarkMode ? AppColours.neutral30 : AppColours.blue90,
              onNextPressed: () {},
              onPreviousPressed: () {},
              label: "Today"),
          const Gap(kPadding16),
          WaterLineChart(logs: ref.watch(waterLogProvider).value!),
        ],
      ),
    );
  }
}

class WaterLineChart extends StatelessWidget {
  final List<WaterLog> logs;
  const WaterLineChart({super.key, required this.logs});

  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    // Sort waterLogs by timestamp
    logs.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Define Spots
    final List<FlSpot> spots = [const FlSpot(6, 0)];
    double totalAmount = 0;
    for (WaterLog entry in logs) {
      totalAmount += entry.amount;

      spots.add(FlSpot(
          entry.timestamp.hour.toDouble() + (entry.timestamp.minute / 60),
          totalAmount / 1000));
    }

    final double maxY = (totalAmount < dailyGoal)
        ? (dailyGoal / 1000).toDouble()
        : totalAmount * 1.2;

    final ThemeData theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  interval: 6,
                  getTitlesWidget: (value, meta) {
                    final period = value < 12 ? 'AM' : 'PM';
                    final displayHour = value > 12 ? value - 12 : value;

                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "$displayHour$period",
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 10, color: AppColours.neutral50),
                      ),
                    );
                  }),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  reservedSize: 50,
                  showTitles: true,
                  interval: maxY / 2,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      "${value.toStringAsFixed(1)} L",
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 9, color: AppColours.neutral50),
                    );
                  }),
            ),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false))),
        borderData: FlBorderData(show: false),
        minX: 6,
        maxX: 24,
        minY: 0,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            curveSmoothness: .1,
            spots: spots,
            isCurved: true,
            color: theme.colorScheme.tertiary,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: theme.colorScheme.tertiary,
                    strokeWidth: 0,
                    strokeColor: theme.colorScheme.tertiary,
                  );
                }),
            belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.tertiary.withValues(alpha:0.5),
                    theme.colorScheme.tertiary.withValues(alpha:0)
                  ],
                )),
          ),
        ],
        lineTouchData: LineTouchData(
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
                          color: theme.colorScheme.tertiary,
                          strokeWidth: 0,
                          strokeColor: theme.colorScheme.tertiary,
                        );
                      }));
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 32,
            getTooltipColor: (LineBarSpot barSport) {
              return theme.colorScheme.tertiary;
            },
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                return LineTooltipItem("${barSpot.y.toStringAsFixed(2)} L",
                    theme.textTheme.bodySmall!.copyWith(color: Colors.white));
              }).toList();
            },
          ),
        ),
      )),
    );
  }
}
