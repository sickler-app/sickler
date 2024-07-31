import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/repositories/user/user_repository.dart';

import '../../core/failure.dart';
import '../../models/models.dart';

class UserNotifier extends AsyncNotifier<SicklerUser> {
  final UserRepository _userRepository;
  UserNotifier({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<SicklerUser> build() async {
    return SicklerUser.empty;
  }

  void saveDataToState(SicklerUser user) {
    state = AsyncValue.data(user);
  }

  Future<void> getUserData(String uid) async {
    state = const AsyncValue.loading();
    //Get all user data first
    await _userRepository.getUserData(uid).whenComplete(() async {
      final Either<Failure, SicklerUser> response =
          await _userRepository.getUserData(uid);
      response.fold((failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      }, (sicklerUserInfo) {
        state = AsyncValue.data(sicklerUserInfo);
      });
    });
  }

  Future<void> addUserData(SicklerUser user) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.addUserData(user);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(user);
    });
  }

  Future<void> updateUserData(SicklerUser user) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.updateUserData(user);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(user);
    });
  }

  Future<void> deleteUserData(String uid) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _userRepository.deleteUserData(uid);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUser.empty);
    });
  }
}
