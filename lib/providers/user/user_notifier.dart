import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/repositories/user/user_repository.dart';

import '../../core/failure.dart';
import '../../models/models.dart';

class UserNotifier extends AsyncNotifier<SicklerUser> {
  final UserRepository _userRepository;
  UserNotifier({required UserRepository userRepository})
      : _userRepository = userRepository;

  ///Getter to actually know when an operation is successful or not;
  bool get isSuccessful =>
      state.whenOrNull(
        data: (user) => user.isNotEmpty,
      ) ??
      false;

  bool get isLoading =>
      state.whenOrNull(
        loading: () => true,
      ) ??
      false;

  String? get errorMessage => state.whenOrNull(
      error: (error, _) => error is Failure ? error.message : error.toString());

  @override
  Future<SicklerUser> build() async {
    return SicklerUser.empty;
  }

  void saveDataToState(SicklerUser user) {
    state = AsyncValue.data(user);
  }

  Future<void> getCurrentUserData({bool forceRefresh = false}) async {
    state = const AsyncValue.loading();

    final Either<Failure, SicklerUser> response =
        await _userRepository.getCurrentUserData(forceRefresh: forceRefresh);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (user) {
      state = AsyncValue.data(user);
    });
  }

  Future<void> addUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    log("ADDING DATA");
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _userRepository.addUserData(
        user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      log("RETURNED SUCCESS");
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(user);
    });
  }

  Future<void> updateUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    log("UPDATING USER DATA");
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _userRepository.updateUserData(
        user: user, updateRemote: updateRemote);
    response.fold((failure) {
      log("RETURNED FAILURE");
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      log("RETURNED SUCCESS");
      //Set the state to be equal to the data that was just added
      state = AsyncValue.data(user);
    });
  }

  Future<void> deleteUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _userRepository.deleteUserData(
        user: user, deleteRemote: updateRemote);
    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUser.empty);
    });
  }
}
