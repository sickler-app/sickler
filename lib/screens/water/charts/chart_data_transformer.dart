import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sickler/core/constants.dart';

import '../../../models/water/water_log.dart';

class ChartDataTransformer {
  static List<FlSpot> transformForDailyTrend(List<WaterLog> logs,
      {int windowSize = 3}) {
    //Group logs by hour and sum amounts
    final Map<int, double> hourlyTotals = {};
    for (WaterLog log in logs) {
      final int hour = log.timestamp.hour;
      hourlyTotals[hour] = (hourlyTotals[hour] ?? 0) + log.amount;
    }
    //Convert to FlSpot list;
    List<FlSpot> spots = hourlyTotals.entries
        .map((e) => FlSpot(e.key.toDouble(), e.value / 1000))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));

    return spots;
    // // Apply moving average smoothing
    // List<FlSpot> smoothedSpots = [];
    // for (int i = 0; i < spots.length; i++) {
    //   double sum = 0;
    //   int count = 0;
    //   for (int j = max(0, i - windowSize + 1); j <= i; j++) {
    //     sum += spots[j].y;
    //     count++;
    //   }
    //   smoothedSpots.add(FlSpot(spots[i].x, sum / count));
    // }
    //
    // return smoothedSpots;
  }

  static List<FlSpot> transformForCumulativeDailyTrend(List<WaterLog> logs) {
    // Sort waterLogs by timestamp
    logs.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Define Spots
    final List<FlSpot> spots = [];
    double totalAmount = 0;
    for (WaterLog entry in logs) {
      totalAmount += (entry.amount / 1000);

      spots.add(FlSpot(
          entry.timestamp.hour.toDouble() + (entry.timestamp.minute / 60),
          totalAmount));
    }
    return spots;
  }

  static List<BarChartGroupData> transformForWeeklyTotals(
      {required List<WaterLog> logs, Color? barColor, double? barWidth}) {
    //Group logs by day and sum amounts
    final Map<int, double> dailyTotals = {};

    ///Todo:Convert into Litres
    for (WaterLog log in logs) {
      final int day = log.timestamp.weekday;
      dailyTotals[day] = (dailyTotals[day] ?? 0) + log.amount;
    }
    //Convert to BarChartGroupData List
    return dailyTotals.entries
        .map((e) => BarChartGroupData(x: e.key, barRods: [
              BarChartRodData(
                  toY: e.value,
                  color: barColor ?? SicklerColours.blueSeed,
                  width: barWidth ?? 16)
            ]))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));
  }

  static List<BarChartGroupData> transformForMonthlyTotals(
      {required List<WaterLog> logs, Color? barColor, double? barWidth}) {
    //Group logs by day and sum amounts
    final Map<int, double> dailyTotals = {};

    ///Todo:Convert into Litres
    for (WaterLog log in logs) {
      final int day = log.timestamp.day;
      dailyTotals[day] = (dailyTotals[day] ?? 0) + log.amount;
    }

    for (int i = 0; i < 30; i++) {
      ///Calculate totals for each day
    }

    //Convert to BarChartGroupData List
    return dailyTotals.entries
        .map((e) => BarChartGroupData(x: e.key, barRods: [
              BarChartRodData(
                  toY: e.value,
                  color: barColor ?? SicklerColours.blueSeed,
                  width: barWidth ?? 16)
            ]))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));
  }

  //Add more transformers
}

double _calculateTotal(List<WaterLog> logs) {
  double total = 0;
  for (WaterLog log in logs) {
    total += log.amount;
  }
  return total;
}

double calculateAverage(List<WaterLog> logs) {
  double total = _calculateTotal(logs);
  return total / logs.length;
}
