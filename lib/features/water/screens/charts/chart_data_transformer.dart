import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sickler/core/constants.dart';
import '../../water.dart';

class ChartDataTransformer {
  static List<FlSpot> transformForDailyTrend(List<WaterLog> logList,
      {int windowSize = 3}) {
    List<WaterLog> logs = List.from(logList);

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
  }

  // static List<FlSpot> transformForCumulativeDailyTrend(List<WaterLog> logs) {
  //   // Sort waterLogs by timestamp
  //   logs.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  //
  //   // Define Spots
  //   final List<FlSpot> spots = [];
  //   double totalAmount = 0;
  //   for (WaterLog entry in logs) {
  //     totalAmount += (entry.amount / 1000);
  //
  //     spots.add(FlSpot(
  //         entry.timestamp.hour.toDouble() + (entry.timestamp.minute / 60),
  //         totalAmount));
  //   }
  //   return spots;
  // }

  static List<FlSpot> transformForCumulativeDailyTrend(List<WaterLog> logList) {
    List<WaterLog> logs = List.from(logList);

    // Sort waterLogs by timestamp
    logs.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // Define Spots
    final List<FlSpot> spots = [];
    double totalAmount = 0;
    DateTime? lastTimestamp;
    double accumulatedAmount = 0;
    int count = 0;

    for (int i = 0; i < logs.length; i++) {
      WaterLog entry = logs[i];
      totalAmount += (entry.amount / 1000);

      if (lastTimestamp == null ||
          entry.timestamp.difference(lastTimestamp).inMinutes > 5) {
        // If it's the first entry or more than 5 minutes have passed, create a new spot
        if (count > 0) {
          // Add the previous accumulated spot
          spots.add(FlSpot(
            lastTimestamp!.hour.toDouble() + (lastTimestamp.minute / 60),
            totalAmount - (accumulatedAmount / 1000),
          ));
        }
        lastTimestamp = entry.timestamp;
        accumulatedAmount = entry.amount.toDouble();
        count = 1;
      } else {
        // Combine with the previous entry
        accumulatedAmount += entry.amount;
        count++;
        // Update lastTimestamp to the average time
        Duration timeDifference = entry.timestamp.difference(lastTimestamp);
        lastTimestamp = lastTimestamp.add(timeDifference ~/ count);
      }

      // If it's the last entry, add the final spot
      if (i == logs.length - 1) {
        spots.add(FlSpot(
          lastTimestamp.hour.toDouble() + (lastTimestamp.minute / 60),
          totalAmount,
        ));
      }
    }

    return spots;
  }

  static List<BarChartGroupData> transformForWeeklyTotals(
      {required List<WaterLog> logList, Color? barColor, double? barWidth}) {
    List<WaterLog> logs = List.from(logList);

    ///Pad the logs to fill up the week
    //DateTime now = DateTime.now();
    int daysInCurrentWeek = 7;

    //Group logs by day and sum amounts
    final Map<int, double> dailyTotals = {};

    ///Todo:Convert into Litres
    for (WaterLog log in logs) {
      final int day = log.timestamp.weekday;
      dailyTotals[day] = (dailyTotals[day] ?? 0) + log.amount / 1000;
    }

    ///Pad the list of dailyTotals to fill up the month
    for (int i = 0; i < daysInCurrentWeek; i++) {
      //Fill the missing days of the month with empty logs.
      dailyTotals.putIfAbsent(i, () => 0);
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
      {required List<WaterLog> logList, Color? barColor, double? barWidth}) {
    List<WaterLog> logs = List.from(logList);

    ///Pad the logs to fill up the month
    DateTime now = DateTime.now();
    int daysInCurrentMonth = DateTime(now.year, now.month + 1, 0)
        .day; //The first day of the next month is auto adjusted to the last day of the previous month, which the month we are interested in.

    //Group logs by day and sum amounts
    final Map<int, double> dailyTotals = {};

    for (WaterLog log in logs) {
      final int day = log.timestamp.day;
      dailyTotals[day] = (dailyTotals[day] ?? 0) + log.amount / 1000;
    }

    ///Pad the list of dailyTotals to fill up the month
    for (int i = 0; i < daysInCurrentMonth; i++) {
      //Fill the missing days of the month with empty logs.
      dailyTotals.putIfAbsent(i, () => 0);
    }

    //Convert to BarChartGroupData List
    return dailyTotals.entries
        .map((e) => BarChartGroupData(x: e.key, barRods: [
              BarChartRodData(
                  toY: e.value,
                  color: barColor ?? SicklerColours.blueSeed,
                  width: barWidth ?? 5)
            ]))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));
  }

  //Add more transformers
}
