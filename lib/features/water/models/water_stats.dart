import 'package:equatable/equatable.dart';

import '../../../core/core.dart';
import '../water.dart';

class WaterStats extends Equatable {
  ///---Today---///
  final List<WaterLog> logsToday;
  final double dailyGoal;
  double get totalToday => calculateTotalFromLogs(logs: logsToday);
  double get percentCompleteToday => ((totalToday / dailyGoal) * 100);
  double get remainingToday =>
      (dailyGoal - totalToday) > 0 ? dailyGoal - totalToday : 0;

  ///---Last 7 Days---///
  final List<WaterLog>? logsLastSevenDays;
  double? get totalLastSevenDays {
    return calculateTotalFromLogs(logs: logsLastSevenDays ?? []);
  }

  Map<DateTime, double> get totalPerDayLastSevenDays {
    return calculateTotalByDay(logs: logsLastSevenDays ?? []);
  }

  double? get averageLastSevenDays {
    return calculateDailyAverageForTimePeriod(
        dailyTotals: totalPerDayLastSevenDays);
  }

  double? get averagePercentCompleteLastSevenDays {
    throw UnimplementedError();
  }

  double? get highestDrunkInLastSevenDays {
    return totalPerDayLastSevenDays.values
        .toList()
        .reduce((value, element) => value > element ? value : element);
  }

  ///---Last 30 Days---///
  final List<WaterLog>? logsLastThirtyDays;

  Map<DateTime, double> get totalPerDayLastThirtyDays {
    return calculateTotalByDay(logs: logsLastThirtyDays ?? []);
  }

  double? get averageLastThirtyDays {
    return calculateDailyAverageForTimePeriod(
        dailyTotals: totalPerDayLastThirtyDays);
  }

  double? get totalLastThirtyDays {
    return calculateTotalFromLogs(logs: logsLastThirtyDays ?? []);
  }

  double? get averagePercentCompleteLastThirtyDays =>
      throw UnimplementedError();
  double? get highestDrunkInLastThirtyDays {
    return totalPerDayLastThirtyDays.values
        .toList()
        .reduce((value, element) => value > element ? value : element);
  }

  ///---This Week---///
  final List<WaterLog>? logsThisWeek;

  Map<DateTime, double> get totalPerDayThisWeek {
    return calculateTotalByDay(logs: logsThisWeek ?? []);
  }

  double? get totalThisWeek {
    return calculateTotalFromLogs(logs: logsThisWeek ?? []);
  }

  double? get averageThisWeek {
    return calculateDailyAverageForTimePeriod(dailyTotals: totalPerDayThisWeek);
  }

  double? get averagePercentCompleteThisWeek {
    return calculateDailyAverageForTimePeriod(dailyTotals: totalPerDayThisWeek);
  }

  double? get highestDrunkInThisWeek {
    return totalPerDayThisWeek.values
        .toList()
        .reduce((value, element) => value > element ? value : element);
  }

  ///---This Month---///
  final List<WaterLog>? logsThisMonth;
  Map<DateTime, double> get totalPerDayThisMonth {
    return calculateTotalByDay(logs: logsThisMonth ?? []);
  }

  double? get averageThisMonth {
    return calculateDailyAverageForTimePeriod(
        dailyTotals: totalPerDayThisMonth);
  }

  double? get totalThisMonth {
    return calculateTotalFromLogs(logs: logsThisMonth ?? []);
  }

  double? get averagePercentCompleteThisMonth {
    return calculateDailyAverageForTimePeriod(
        dailyTotals: totalPerDayThisMonth);
  }

  double? get highestDrunkInThisMonth {
    return totalPerDayThisMonth.values
        .toList()
        .reduce((value, element) => value > element ? value : element);
  }

  const WaterStats({
    required this.logsToday,
    required this.dailyGoal,
    required this.logsLastSevenDays,
    this.logsLastThirtyDays,
    this.logsThisWeek,
    this.logsThisMonth,
  });

  //Create copyWith
  WaterStats copyWith({
    List<WaterLog>? logsToday,
    double? dailyGoal,
    double? percentCompleteToday,
    double? remainingToday,
    //
    List<WaterLog>? logsLastSevenDays,
    double? averageLastSevenDays,
    double? totalLastSevenDays,
    double? averagePercentCompleteLastSevenDays,
    double? highestDrunkInLastSevenDays,
    //
    List<WaterLog>? logsLastThirtyDays,
    double? averageLastThirtyDays,
    double? totalLastThirtyDays,
    double? averagePercentCompleteLastThirtyDays,
    double? highestDrunkInLastThirtyDays,
    //
    List<WaterLog>? logsThisWeek,
    double? averageThisWeek,
    double? totalThisWeek,
    double? averagePercentCompleteThisWeek,
    double? highestDrunkInThisWeek,
    //
    List<WaterLog>? logsThisMonth,
    double? averageThisMonth,
    double? totalThisMonth,
    double? averagePercentCompleteThisMonth,
    double? highestDrunkInThisMonth,
  }) {
    return WaterStats(
      logsToday: logsToday ?? this.logsToday,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      //
      logsLastSevenDays: logsLastSevenDays ?? this.logsLastSevenDays,
      //
      logsLastThirtyDays: logsLastThirtyDays ?? this.logsLastThirtyDays,
      //
      logsThisWeek: logsThisWeek ?? this.logsThisWeek,
      //
      logsThisMonth: logsThisMonth ?? this.logsThisMonth,
    );
  }

  double calculateTotalFromLogs({required List<WaterLog> logs}) {
    if (logs.isEmpty) return 0;

    double totalToday = 0;
    //Calculate total
    for (WaterLog log in logs) {
      totalToday += log.amount;
    }
    return totalToday;
  }

  Map<DateTime, double> calculateTotalByDay({required List<WaterLog> logs}) {
    Map<DateTime, double> dailyTotals = {};

    if (logs.isEmpty) return {};

    for (var log in logs) {
      // Create a DateTime object for just the date part (ignoring time)
      final date =
      DateTime(log.timestamp.year, log.timestamp.month, log.timestamp.day);

      // Convert amount to milliliters if necessary
      double amountInMl = log.unit == Units.millilitres
          ? log.amount
          : convertToMilliliters(log.amount, log.unit);

      double amountInLitres = amountInMl/1000;

      // Add to the daily total
      dailyTotals.update(
        date,
            (existingTotal) => existingTotal + amountInLitres,
        ifAbsent: () => amountInLitres,
      );
    }

    // Sort the map by date
    var sortedEntries = dailyTotals.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Map.fromEntries(sortedEntries);
  }

  // Helper function to convert other units to milliliters
  double convertToMilliliters(double amount, Units fromUnit) {
    switch (fromUnit) {
      case Units.millilitres:
        return amount;
      case Units.litres:
        return amount * 1000;
      case Units.ounce:
        return amount * 29.5735; // 1 fl oz ≈ 29.5735 ml
    // case Units:
    //   return amount * 236.588; // 1 cup ≈ 236.588 ml
      default:
        throw ArgumentError('Unsupported unit: $fromUnit');
    }
  }

  double calculateDailyAverageForTimePeriod(
      {required Map<DateTime, double> dailyTotals}) {
    double totalAcrossAllDays = 0;
    for (double totalInADay in dailyTotals.values.toList()) {
      totalAcrossAllDays += totalInADay;
    }
    return (totalAcrossAllDays / dailyTotals.length);
  }

  @override
  List<Object?> get props => [
    logsToday,
    dailyGoal,
    logsLastSevenDays,
    logsLastThirtyDays,
    logsThisWeek,
    logsThisMonth,
  ];
}