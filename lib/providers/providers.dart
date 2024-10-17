import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../services/services.dart';
import 'provider_notifiers.dart';

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

/// ------ User and Profile Providers ------ ///
final UserService userService = UserService();
final UserLocalService userLocalService = UserLocalService();
final UserRepository userRepository = UserRepository(
    userService: userService,
    userLocalService: userLocalService,
    authService: authService);

final userProvider = AsyncNotifierProvider<UserNotifier, AppUser>(
    () => UserNotifier(userRepository: userRepository));

