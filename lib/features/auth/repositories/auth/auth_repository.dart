import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/core.dart';

import '../../auth.dart';
import '../../services/auth/remote/auth_service.dart';
import '../../services/user/local/user_local_service.dart';

class AuthRepository {
  final AuthService _authService;
  final UserLocalService _userLocalService;

  AuthRepository(
      {required AuthService authService,
      required UserLocalService userLocalService})
      : _userLocalService = userLocalService,
        _authService = authService;

  FutureEither<AppUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return futureHandler(() async {
      final UserCredential userCredential = await _authService
          .signInWithEmailAndPassword(email: email, password: password);

      return _handleUserCredential(userCredential);
    });
  }

  FutureEither<AppUser?> registerWithEmailAndPassword(
      {required String email, required String password}) {
    return futureHandler(() async {
      final UserCredential userCredential = await _authService
          .registerWithEmailAndPassword(email: email, password: password);
      return _handleUserCredential(userCredential);
    });
  }

  FutureEither<AppUser> signInWithGoogle() {
    return futureHandler(() async {
      final UserCredential userCredential =
          await _authService.signInWithGoogle();
      return _handleUserCredential(userCredential);
    });
  }

  FutureEither<void> signOut() {
    return futureHandler(() async {
      await _userLocalService.deleteUser();
      await _authService.signOut();
    });
  }

  Stream<AppUser> getAuthStateChanges() {
    return _authService.authStateChanges().map((User? user) {
      if (user == null) {
        return AppUser.empty;
      }
      return AppUser.fromUser(user: user).copyWith(
        profile: UserProfile.fromFirebaseUser(user: user),
      );
    });
  }

  FutureEither<void> sendPasswordResetEmail({
    required String email,
  }) async {
    return futureHandler(() async {
      await _authService.sendPasswordResetEmail(email: email);
    });
  }

  FutureEither<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    return futureHandler(() async {
      await _authService.confirmPasswordReset(
          code: code, newPassword: newPassword);
    });
  }

  Future<AppUser> _handleUserCredential(
      UserCredential userCredential) async {
    AppUser sicklerUser = AppUser.fromUser(user: userCredential.user);
    sicklerUser = sicklerUser.copyWith(
        profile: UserProfile.fromFirebaseUser(user: userCredential.user));

    await _userLocalService.addUser(sicklerUser);
    return sicklerUser;
  }
}
