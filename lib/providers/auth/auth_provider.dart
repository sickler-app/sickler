import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';

class AuthProviderNotifier extends AutoDisposeAsyncNotifier<SicklerUser?> {
  final AuthRepository authRepository;

  @override
  Future<SicklerUser> build() async {
    return SicklerUser.empty;
  }

  AuthProviderNotifier({required this.authRepository});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final Either<Failure, SicklerUser?> response = await authRepository
        .signInWithEmailAndPassword(email: email, password: password);
    state = const AsyncValue.loading();
    response.fold((failure) {
      state = AsyncValue.data(SicklerUser.empty);
    }, (sicklerUser) {
      state = AsyncValue.data(sicklerUser);
    });
  }

  Future<void> authStateChanges() async {
    final Either<Failure, Stream<SicklerUser?>> response =
        authRepository.getAuthStateChanges();

    state = const AsyncValue.loading();
    response.fold((failure) {
     // state = AsyncValue.data(SicklerUser.empty);
      state = AsyncValue.error(failure, StackTrace.current);
    }, (stream) {
      stream.listen((event) {
        state = AsyncValue.data(event);
      });
    });
  }
}
