import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/repositories/user/user_repository.dart';

import '../../core/failure.dart';
import '../../models/models.dart';

class UserHealthInfoNotifier extends AsyncNotifier<SicklerUserHealthInfo> {
  final UserRepository _userRepository;
  UserHealthInfoNotifier({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<SicklerUserHealthInfo> build() async {
    return SicklerUserHealthInfo.empty;
  }

  Future<void> getUserHealthData(String uid) async {
    state = const AsyncValue.loading();
    //Get all user data first
    await _userRepository.getAllUserData(uid).whenComplete(() async {
      final Either<Failure, SicklerUserHealthInfo> response =
          await _userRepository.getUserHealthData(uid);
      response.fold((failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      }, (sicklerHealthInfo) {
        state = AsyncValue.data(sicklerHealthInfo);
      });
    });
  }

  Future<void> addUserHealthData(SicklerUserHealthInfo healthInfo) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.addUserHealthDataData(healthInfo);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(healthInfo);
    });
  }

  Future<void> updateUserHealthData(SicklerUserHealthInfo healthInfo) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.updateUserHealthDataData(healthInfo);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(healthInfo);
    });
  }

  Future<void> deleteUserData(String uid) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.deleteUserData(uid);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUserHealthInfo.empty);
    });
  }
}
