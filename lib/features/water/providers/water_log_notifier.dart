import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../../auth/models/user/app_user.dart';
import '../water.dart';

class WaterLogNotifier extends AsyncNotifier<List<WaterLog>> {
  final WaterRepository _waterRepository;
  WaterLogNotifier({required WaterRepository waterRepository})
      : _waterRepository = waterRepository;

  ///Getters to actually know when an operation is successful or not;
  bool get isSuccessful =>
      state.hasValue &&
      state.value != null &&
      state.value!.isNotEmpty &&
      !state.hasError;

  String? get errorMessage => state.error is Failure
      ? (state.error as Failure).message
      : state.error.toString();

  @override
  Future<List<WaterLog>> build() async {
    return [];
  }

  /// --- Logs ----///
  Future<void> getWaterLogs(
      {AppUser? user,
      bool? getFromRemote,
      DateTime? start,
      DateTime? end}) async {
    state = const AsyncValue.loading();
    final Either<Failure, List<WaterLog>> response =
        await _waterRepository.getWaterLogs(
            user: user,
            getFromRemote: getFromRemote,
            start:
                start ?? DateTime.now().copyWith(hour: 0, minute: 0, second: 0),
            end: end ??
                DateTime.now().copyWith(hour: 23, minute: 59, second: 59));
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (waterLogs) {
      log("RETURNED SUCCESS");
      state = AsyncValue.data(waterLogs);
    });
  }

  double calculateTotalFromLogs({List<WaterLog>? logs}) {
    List<WaterLog> allLogs = logs ?? state.value!;

    double totalToday = 0;
    //Calculate total
    for (WaterLog log in allLogs) {
      totalToday += log.amount;
    }
    return totalToday;
  }
  //
  // Future<List<WaterLog>> _getLogsWithinTimeFrame(
  //     {required DateTime start, required DateTime end}) async {
  //   List<WaterLog> logs = state.value!;
  //
  //   //Filter for just logs within timeframe
  //   logs = logs.filter((log) {
  //     return log.timestamp.isAfter(start) && log.timestamp.isBefore(end);
  //   }).toList();
  //
  //   _logsWithinTimeframe = logs;
  //
  //   if (logs.isEmpty) {
  //     _totalWithinTimeframe = 0;
  //   }
  //   //Calculate total
  //   _totalWithinTimeframe = 0;
  //   for (WaterLog log in logs) {
  //     _totalWithinTimeframe += log.amount;
  //   }
  //
  //   return logs;
  // }

  Future<void> addWaterLog(
      {required WaterLog entry,
      required AppUser user,
      bool updateRemote = false}) async {
    //print("Adding log");
    Stopwatch stopwatch = Stopwatch()..start();
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _waterRepository.addWaterLog(
        log: entry, user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterLogs();
      //  print("Added stopwatch and got updated logs");
      stopwatch.stop();
      log("Add water log took ${stopwatch.elapsedMilliseconds} ms");
    });
  }

  Future<void> updateWaterLog({
    required WaterLog entry,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _waterRepository.addWaterLog(
        log: entry, user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterLogs();
    });
  }

  Future<void> deleteWaterLog({
    required WaterLog entry,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _waterRepository.deleteLog(
        log: entry, user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterLogs();
    });
  }

  Future<void> clear({
    required AppUser user,
    bool updateRemote = false,
  }) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _waterRepository.clear(user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterLogs();
    });
  }
}
