import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';
import '../../../services/services.dart';
import '../../../providers/provider_notifiers.dart';

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

