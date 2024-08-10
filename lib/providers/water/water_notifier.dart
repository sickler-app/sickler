import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/repositories/water/water_repository.dart';

import '../../core/core.dart';
import '../../models/user/sickler_user.dart';

class WaterNotifier extends AsyncNotifier<List<WaterLog>> {
  final WaterRepository _waterRepository;
  WaterNotifier({required WaterRepository waterRepository})
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

  Future<void> getWaterLogs({SicklerUser? user, bool? getFromRemote}) async {
    state = const AsyncValue.loading();
    final Either<Failure, List<WaterLog>> response = await _waterRepository
        .getWaterLogs(user: user, getFromRemote: getFromRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (waterLogs) {
      log("RETURNED SUCCESS");
      state = AsyncValue.data(waterLogs);
    });
  }

  Future<void> addWaterLog({
    required WaterLog entry,
    required SicklerUser user,
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

  Future<void> updateWaterLog({
    required WaterLog entry,
    required SicklerUser user,
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
    required SicklerUser user,
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
    required SicklerUser user,
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
