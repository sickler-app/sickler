import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/repositories/user/user_repository.dart';

class UserProfileInfoNotifier extends AsyncNotifier<SicklerUserProfileInfo> {
  final UserRepository _userRepository;
  UserProfileInfoNotifier({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  FutureOr<SicklerUserProfileInfo> build() {
    return SicklerUserProfileInfo.empty;
  }

  Future<void> getUserProfileData(String uid) async {
    state = AsyncValue.loading();
    // Get all User Data
    await _userRepository.getAllUserData(uid).whenComplete(() async {
      final Either<Failure, SicklerUserProfileInfo> response =
          await _userRepository.getUserProfileData(uid);

      response.fold((failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      }, (sicklerUserProfileInfo) {
        state = AsyncValue.data(sicklerUserProfileInfo);
      });
    });
  }

  Future<void> addUserProfileData(SicklerUserProfileInfo profileInfo) async {
    state = AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.addUserProfileData(profileInfo);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(profileInfo);
    });
  }

  Future<void> updateUserProfileData(SicklerUserProfileInfo profileInfo) async {
    state = AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.updateUserProfileData(profileInfo);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(profileInfo);
    });
  }

  Future<void> deleteUserData(String uid) async {
    state = AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.deleteUserData(uid);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUserProfileInfo.empty);
    });
  }
}
