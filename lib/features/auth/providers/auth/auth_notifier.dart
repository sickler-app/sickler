import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/features/auth/models/app_user.dart';
import 'package:sickler/features/auth/repositories/auth/auth_repository.dart';

class AuthNotifier extends AsyncNotifier<AppUser?> {
  final AuthRepository _authRepository;

  AuthNotifier({required AuthRepository authRepository})
      : _authRepository = authRepository;

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
  Future<AppUser> build() async {
    return AppUser.empty;
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    final Either<Failure, AppUser?> response = await _authRepository
        .signInWithEmailAndPassword(email: email, password: password);

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    final Either<Failure, AppUser?> response = await _authRepository
        .registerWithEmailAndPassword(email: email, password: password);

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> singInWithGoogle() async {
    state = const AsyncValue.loading();
    final Either<Failure, AppUser?> response =
        await _authRepository.signInWithGoogle();

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _authRepository.signOut();

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(AppUser.empty);
    });
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response =
        await _authRepository.sendPasswordResetEmail(email: email);

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(AppUser.empty);
    });
  }

  Future<void> confirmPasswordReset(
      {required String code, required String newPassword}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _authRepository
        .confirmPasswordReset(code: code, newPassword: newPassword);

    response.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      state = AsyncValue.data(AppUser.empty);
    });
  }

  Stream<AppUser> authStateChanges() {
    final Stream<AppUser> userStream =
        _authRepository.getAuthStateChanges();

    userStream.listen((event) {
      state = AsyncValue.data(event);
    }).onError((error) {
      state = AsyncValue.error(error, StackTrace.current);
    });

    return userStream;
  }
}
