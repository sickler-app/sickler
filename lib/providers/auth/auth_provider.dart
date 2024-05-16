import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';

class AuthProviderNotifier extends AutoDisposeAsyncNotifier<SicklerUser?> {
  final AuthRepository _authRepository;
  String? errorMessage;
  AuthState authState = AuthState.loading;

  AuthProviderNotifier({required AuthRepository authRepository})
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
      errorMessage = failure.errorMessage;
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
      errorMessage = failure.errorMessage;
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
      errorMessage = failure.errorMessage;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _authRepository.signOut();

    response.fold((failure) {
      errorMessage = failure.errorMessage;
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
      errorMessage = failure.errorMessage;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      ///Do something?
    });
  }

  Future<void> confirmPasswordReset(
      {required String code, required String newPassword}) async {
    state = const AsyncValue.loading();
    final Either<Failure, void> response = await _authRepository
        .confirmPasswordReset(code: code, newPassword: newPassword);

    response.fold((failure) {
      errorMessage = failure.errorMessage;
      state = AsyncValue.error(failure, StackTrace.current);
    }, (empty) {
      ///Do something?
    });


  }

  Future<void> authStateChanges() async {
    final Either<Failure, Stream<SicklerUser?>> response =
    _authRepository.getAuthStateChanges();

    response.fold((failure) {
      errorMessage = failure.errorMessage;
    //  state = AsyncValue.error(failure, StackTrace.current);
    }, (stream) {
      ///Do something?
      ///
      ///
      print(authState);
      stream.listen((event) {
        print("listening to auth state stream");
        if (event == null || event.isEmpty) {
          print("un-authenticated event occurred");
          authState = AuthState.unauthenticated;
          print(authState);
        } else {
          print("authenticated event occurred");
          authState = AuthState.authenticated;
          print(authState);
        }

        state = AsyncValue.data(event);       ///Just adding a state assignment so RiverPod rebuilds
      });
    });
  }
}
