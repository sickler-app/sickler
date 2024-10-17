import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../water.dart';


/// ------ Water Related Providers ------ ///
///
///

final WaterService waterService = WaterService();
final WaterLocalService waterLocalService = WaterLocalService();
final WaterRepository waterRepository = WaterRepository(
    waterService: waterService, waterLocalService: waterLocalService);

final waterLogProvider =
    AsyncNotifierProvider<WaterLogNotifier, List<WaterLog>>(
        () => WaterLogNotifier(waterRepository: waterRepository));

final waterPreferencesProvider =
    AsyncNotifierProvider<WaterPrefsNotifier, WaterPreferences>(
        () => WaterPrefsNotifier(waterRepository: waterRepository));

final waterStatsProvider = Provider<WaterStats>((ref) {
  final AsyncValue<List<WaterLog>> waterLogsAsync = ref.watch(waterLogProvider);

  return waterLogsAsync.when(data: (allLogs) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime sevenDaysAgo = today.subtract(const Duration(days: 6));
    final DateTime thirtyDaysAgo = today.subtract(const Duration(days: 29));
    final DateTime startOfWeek =
        today.subtract(Duration(days: now.weekday - 1));
    final DateTime startOfMonth = DateTime(now.year, now.month, 1);

    List<WaterLog> logsToday = allLogs
        .where((log) =>
            log.timestamp.isAfter(today) && log.timestamp.isBefore(tomorrow))
        .toList();

    List<WaterLog> logsLastSevenDays = allLogs
        .where((log) =>
            log.timestamp.isAfter(sevenDaysAgo) &&
            log.timestamp.isBefore(tomorrow))
        .toList();

    List<WaterLog> logsLastThirtyDays = allLogs
        .where((log) =>
            log.timestamp.isAfter(thirtyDaysAgo) &&
            log.timestamp.isBefore(tomorrow))
        .toList();

    List<WaterLog> logsThisWeek = allLogs
        .where((log) =>
            log.timestamp.isAfter(startOfWeek) &&
            log.timestamp.isBefore(tomorrow))
        .toList();

    List<WaterLog> logsThisMonth = allLogs
        .where((log) =>
            log.timestamp.isAfter(startOfMonth) &&
            log.timestamp.isBefore(tomorrow))
        .toList();

    double dailyGoal =
        ref.watch(waterPreferencesProvider).value!.dailyGoal!.toDouble();

    return WaterStats(
        logsToday: logsToday,
        dailyGoal: dailyGoal,
        logsLastSevenDays: logsLastSevenDays,
        logsLastThirtyDays: logsLastThirtyDays,
        logsThisWeek: logsThisWeek,
        logsThisMonth: logsThisMonth);
  }, loading: () {
    return const WaterStats(
        logsToday: [],
        logsLastSevenDays: [],
        logsLastThirtyDays: [],
        logsThisWeek: [],
        logsThisMonth: [],
        dailyGoal: 2000);
  }, error: (_, __) {
    return const WaterStats(
        logsToday: [],
        logsLastSevenDays: [],
        logsLastThirtyDays: [],
        logsThisWeek: [],
        logsThisMonth: [],
        dailyGoal: 2000);
  });
});
