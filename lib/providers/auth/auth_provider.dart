import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';

class AuthProviderNotifier extends Notifier<SicklerUser?> {
  final AuthRepository authRepository;

  AuthProviderNotifier({required this.authRepository});

  AppState appState = AppState.initial;
  //SicklerUser? _currentUser = SicklerUser.empty;

  @override
  SicklerUser build() {
    return SicklerUser.empty;
  }

  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final Either<Failure, SicklerUser?> response = await authRepository
        .signInWithEmailAndPassword(email: email, password: password);

    response.fold((failure) {
      appState = AppState.error;
      state = SicklerUser.empty;
      // state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      appState = AppState.success;
      // _currentUser = sicklerUser;
      state = sicklerUser;
    });
  }

  void authStateChanges() async {
    final Either<Failure, Stream<SicklerUser?>> response =
        await authRepository.getAuthStateChanges();

    response.fold((failure) {
      appState = AppState.error;
      state = SicklerUser.empty;
      // state = AsyncValue.error(failure, StackTrace.current);
    }, (stream) {
      appState = AppState.success;
      stream.listen((event) {
        state = event;
      });
    });
  }
}
