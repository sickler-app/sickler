import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/services/user/user_service.dart';

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

final currentUserStreamProvider = StreamProvider<SicklerUser?>((ref) {
  return ref.watch(authProvider.notifier).getAuthStateChanges();
});

/// ------ User and Profile Providers ------ ///
final UserService userService = UserService();
final UserRepository userRepository = UserRepository(userService: userService);

final userInfoProvider =
    AsyncNotifierProvider<UserInfoNotifier, SicklerUserInfo>(
        () => UserInfoNotifier(userRepository: userRepository));
