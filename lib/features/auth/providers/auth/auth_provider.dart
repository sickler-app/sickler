import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth.dart';
import '../../services/auth/remote/auth_service.dart';




///------Auth Related Providers------///
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(
    authService: authService, userLocalService: userLocalService);

final authProvider = AsyncNotifierProvider<AuthNotifier, AppUser?>(
        () => AuthNotifier(authRepository: authRepository));

@Deprecated("Deprecating the authStateChangesStreamProvider")
final authStateChangesStreamProvider =
StreamProvider<AppUser>((ref) async* {
  yield* ref.watch(authProvider.notifier).authStateChanges();
});

