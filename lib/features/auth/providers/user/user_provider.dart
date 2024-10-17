/// ------ User and Profile Providers ------ ///
final UserService userService = UserService();
final UserLocalService userLocalService = UserLocalService();
final UserRepository userRepository = UserRepository(
    userService: userService,
    userLocalService: userLocalService,
    authService: authService);

final userProvider = AsyncNotifierProvider<UserNotifier, AppUser>(
        () => UserNotifier(userRepository: userRepository));
