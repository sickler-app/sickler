import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/providers/water/water_notifier.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../services/services.dart';
import 'provider_notifiers.dart';

///------Auth Related Providers------///
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(
    authService: authService, userLocalService: userLocalService);

final authProvider = AsyncNotifierProvider<AuthNotifier, SicklerUser?>(
    () => AuthNotifier(authRepository: authRepository));

@Deprecated("Deprecating the authStateChangesStreamProvider")
final authStateChangesStreamProvider =
    StreamProvider<SicklerUser>((ref) async* {
  yield* ref.watch(authProvider.notifier).authStateChanges();
});

/// ------ User and Profile Providers ------ ///
final UserService userService = UserService();
final UserLocalService userLocalService = UserLocalService();
final UserRepository userRepository = UserRepository(
    userService: userService,
    userLocalService: userLocalService,
    authService: authService);

final userProvider = AsyncNotifierProvider<UserNotifier, SicklerUser>(
    () => UserNotifier(userRepository: userRepository));

/// ------ Water Related Providers ------ ///

final WaterService waterService = WaterService();
final WaterLocalService waterLocalService = WaterLocalService();
final WaterRepository waterRepository = WaterRepository(
    waterService: waterService, waterLocalService: waterLocalService);

final waterProvider = AsyncNotifierProvider<WaterNotifier, List<WaterLog>>(
    () => WaterNotifier(waterRepository: waterRepository));
