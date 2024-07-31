import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/services/user/local/user_local_service.dart';
import 'package:sickler/services/user/remote/user_service.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../repositories/user/user_repository.dart';
import '../services/services.dart';
import 'provider_notifiers.dart';

///------Auth Related Providers------///
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(authService: authService);

final authProvider = AsyncNotifierProvider<AuthNotifier, SicklerUser?>(
    () => AuthNotifier(authRepository: authRepository));

final authStateChangesStreamProvider =
    StreamProvider<SicklerUser>((ref) async* {
  yield* ref.watch(authProvider.notifier).authStateChanges();
});

/// ------ User and Profile Providers ------ ///
final UserService userService = UserService();
final UserLocalService userLocalService = UserLocalService();
final UserRepository userRepository = UserRepository(
    userService: userService, userLocalService: userLocalService);

final userProvider = AsyncNotifierProvider<UserNotifier, SicklerUser>(
    () => UserNotifier(userRepository: userRepository));
