import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/services/auth/auth_service.dart';

import '../../core/core.dart';

class AuthRepository {
  final AuthService authService;
  final StreamController<SicklerUser?> sicklerUserStreamController =
      StreamController();

  AuthRepository({required this.authService});
  // FutureEither<User?> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final UserCredential userCredential = await authService
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     return Right(userCredential.user);
  //   } on FirebaseException catch (e) {
  //     return Left(Failure(errorMessage: e.message));
  //   } on Exception catch (e) {
  //     return Left(Failure(errorMessage: e.toString()));
  //   }
  // }

  /// A Version with calling method
  FutureEither<SicklerUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return callFutureMethod(() async {
      final UserCredential userCredential = await authService
          .signInWithEmailAndPassword(email: email, password: password);

      SicklerUser sicklerUser = SicklerUser.fromUser(user: userCredential.user);
      return sicklerUser;
    });
  }

  FutureEither<SicklerUser?> registerWithEmailAndPassword(
      {required String email, required String password}) {
    return callFutureMethod(() async {
      final UserCredential userCredential = await authService
          .registerWithEmailAndPassword(email: email, password: password);
      SicklerUser sicklerUser = SicklerUser.fromUser(user: userCredential.user);
      return sicklerUser;
    });
  }

  FutureEither<SicklerUser> signInWithGoogle() {
    return callFutureMethod(() async {
      final UserCredential userCredential =
          await authService.signInWithGoogle();

      SicklerUser sicklerUser = SicklerUser.fromUser(user: userCredential.user);
      return sicklerUser;
    });
  }

  FutureEither<void> signOut() {
    return callFutureMethod(() async {
      authService.signOut();
    });
  }

  Either<Failure, Stream<SicklerUser?>> getAuthStateChanges() {
    return callMethod(() {
      authService.getCurrentUser().listen((User? event) {
        ///Listens to the current user stream and outputs another stream of sickler
        ///users on every event;
        sicklerUserStreamController.add(SicklerUser.fromUser(user: event));
      });

      return sicklerUserStreamController.stream;
    });
  }

  FutureEither<void> sendPasswordResetEmail({
    required String email,
  }) async {
    return callFutureMethod(() async {
      await authService.sendPasswordResetEmail(email: email);
    });
  }

  FutureEither<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    return callFutureMethod(() async {
      await authService.confirmPasswordReset(
          code: code, newPassword: newPassword);
    });
  }

  Future<void> disposeAuthStateChangesStream()async {
    sicklerUserStreamController.close();
  }
}
