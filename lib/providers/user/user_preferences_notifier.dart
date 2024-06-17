import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/models/user/user_preferences.dart';
import 'package:sickler/repositories/user/user_preferences_repository.dart';

import '../../core/core.dart';

class UserPreferencesNotifier extends AsyncNotifier<UserPreferences> {
  final UserPreferencesRepository _userPreferencesRepository;
  UserPreferencesNotifier({
    required UserPreferencesRepository userPrefsRepository,
  }) : _userPreferencesRepository = userPrefsRepository;

  @override
  Future<UserPreferences> build() async {
    return UserPreferences.empty;
  }

  Future<void> getUserPreferences(String uid) async {
    state = AsyncValue.loading();

    Either<Failure, UserPreferences> response =
        await _userPreferencesRepository.getUserPreferences(uid);

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (userPreferences) {
      state = AsyncValue.data(userPreferences);
    });
  }

  Future<void> addUserPreferences(UserPreferences userPreferences) async {
    state = AsyncValue.loading();
    Either<Failure, void> response =
        await _userPreferencesRepository.addUserPreferences(userPreferences);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      ///Call get User Preferences again to handle getting the updated preferences; It was also handle updating the state
      await getUserPreferences(userPreferences.uid);
    });
  }

  Future<void> updateUserPreferences(UserPreferences userPreferences) async {
    state = AsyncValue.loading();
    Either<Failure, void> response =
        await _userPreferencesRepository.updateUserPreferences(userPreferences);

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      await getUserPreferences(userPreferences.uid);
    });
  }

  Future<void> deleteUserPreferences(UserPreferences userPreferences) async {
    state = AsyncValue.loading();
    Either<Failure, void> response =
        await _userPreferencesRepository.deleteUserPreferences(userPreferences);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) async {
      state = AsyncValue.data(userPreferences);
      await getUserPreferences(userPreferences.uid);
    });
  }
}
