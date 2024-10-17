import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth.dart';
import '../../services/user/local/user_local_service.dart';
import '../../services/user/remote/user_service.dart';

/// ------ User and Profile Providers ------ ///
final UserService userService = UserService();
final UserLocalService userLocalService = UserLocalService();
final UserRepository userRepository = UserRepository(
    userService: userService,
    userLocalService: userLocalService,
    authService: authService);

final userProvider = AsyncNotifierProvider<UserNotifier, AppUser>(
        () => UserNotifier(userRepository: userRepository));
