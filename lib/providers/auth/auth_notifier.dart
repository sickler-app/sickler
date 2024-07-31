import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/user/sickler_user.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';

class AuthNotifier extends AsyncNotifier<SicklerUser?> {
  final AuthRepository _authRepository;
  String? errorMessage;
  AuthNotifier({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SicklerUser> build() async {
    return SicklerUser.empty;
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    final Either<Failure, SicklerUser?> response = await _authRepository
        .signInWithEmailAndPassword(email: email, password: password);

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    final Either<Failure, SicklerUser?> response = await _authRepository
        .registerWithEmailAndPassword(email: email, password: password);

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> singInWithGoogle() async {
    state = const AsyncValue.loading();
    final Either<Failure, SicklerUser?> response =
        await _authRepository.signInWithGoogle();

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _authRepository.signOut();

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUser.empty);
    });
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _authRepository.sendPasswordResetEmail(email: email);

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUser.empty);
    });
  }

  Future<void> getCurrentUser() async {
    state = const AsyncValue.loading();
    final Either<Failure, SicklerUser> response =
        await _authRepository.getCurrentUser();

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> confirmPasswordReset(
      {required String code, required String newPassword}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _authRepository
        .confirmPasswordReset(code: code, newPassword: newPassword);

    response.fold((failure) {
      errorMessage = failure.message;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(SicklerUser.empty);
    });
  }

  Stream<SicklerUser> authStateChanges() {
    final Stream<SicklerUser> userStream =
        _authRepository.getAuthStateChanges();

    userStream.listen((event) {
      state = AsyncValue.data(event);
    }).onError((error) {
      state = AsyncValue.error(error, StackTrace.current);
    });

    return userStream;
  }
}
