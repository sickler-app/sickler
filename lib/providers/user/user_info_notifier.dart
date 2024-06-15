import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/repositories/user/user_repository.dart';

import '../../core/failure.dart';
import '../../models/models.dart';

class UserInfoNotifier extends AsyncNotifier<SicklerUserInfo> {
  final UserRepository _userRepository;
  UserInfoNotifier({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<SicklerUserInfo> build() async {
    return SicklerUserInfo.empty;
  }

  void saveDataToState(SicklerUserInfo userInfo) {
    state = AsyncValue.data(userInfo);
  }

  Future<void> getUserData(String uid) async {
    state = const AsyncValue.loading();
    //Get all user data first
    await _userRepository.getUserData(uid).whenComplete(() async {
      final Either<Failure, SicklerUserInfo> response =
          await _userRepository.getUserData(uid);
      response.fold((failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      }, (sicklerUserInfo) {
        state = AsyncValue.data(sicklerUserInfo);
      });
    });
  }

  Future<void> addUserData(SicklerUserInfo userInfo) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.addUserData(userInfo);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(userInfo);
    });
  }

  Future<void> updateUserData(SicklerUserInfo userInfo) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.updateUserData(userInfo);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(userInfo);
    });
  }

  Future<void> deleteUserData(String uid) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.deleteUserData(uid);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUserInfo.empty);
    });
  }
}
