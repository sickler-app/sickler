import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/core.dart';
import '../../auth/auth.dart';
import '../water.dart';

class WaterPrefsNotifier extends AsyncNotifier<WaterPreferences> {
  final WaterRepository _waterRepository;
  WaterPrefsNotifier({required WaterRepository waterRepository})
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
  WaterPreferences _preferences = const WaterPreferences.initial();
  WaterPreferences get preferences => _preferences;

  @override
  Future<WaterPreferences> build() async {
    return WaterPreferences.empty;
  }

  /// Water Preferences
  Future<void> getWaterPreferences(
      {AppUser? user, bool? getFromRemote}) async {
    state = const AsyncValue.loading();
    final Either<Failure, WaterPreferences> response = await _waterRepository
        .getWaterPreferences(user: user, getFromRemote: getFromRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (prefs) {
      log("RETURNED SUCCESS");
      _preferences = prefs;
      //Just add the old state of water logs to trigger an update
      state = AsyncValue.data(state.value!);
    });
  }

  Future<void> addWaterPreferences(
      {required WaterPreferences preferences,
      AppUser? user,
      bool updateRemote = false}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _waterRepository.addPreferences(
            preferences: preferences, user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterPreferences();
    });
  }

  Future<void> updateWaterPreferences({
    required WaterPreferences preferences,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _waterRepository.updatePreferences(
            preferences: preferences, user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterPreferences();
    });
  }

  Future<void> deleteWaterPreferences({
    required WaterPreferences preferences,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _waterRepository
        .deletePreferences(user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      log("RETURNED SUCCESS");
      await getWaterPreferences();
    });
  }
}
