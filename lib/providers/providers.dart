import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/repositories/user/user_preferences_repository.dart';
import 'package:sickler/services/user/local/user_preferences_database_service.dart';
import 'package:sickler/services/user/remote/user_service.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../repositories/user/user_repository.dart';
import '../services/services.dart';
import '../services/user/remote/user_preferences_service.dart';
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

/// ----- User Preferences Providers ----///

final UserPreferencesService userPreferencesService = UserPreferencesService();
final UserPreferencesLocalDBService userPreferencesLocalDatabaseService =
    UserPreferencesLocalDBService();
final UserPreferencesRepository userPreferencesRepository =
    UserPreferencesRepository(
        userPreferencesService: userPreferencesService,
        userPreferencesLocalDatabaseService:
            userPreferencesLocalDatabaseService);

final userPreferencesProvider =
    AsyncNotifierProvider<UserPreferencesNotifier, UserPreferences>(() =>
        UserPreferencesNotifier(
            userPrefsRepository: userPreferencesRepository));
