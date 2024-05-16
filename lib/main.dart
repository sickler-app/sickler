import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/core/routes.dart';
import 'package:sickler/core/theme.dart';
import 'package:sickler/firebase_options.dart';
import 'package:sickler/providers/auth/auth_provider.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/screens/global_components/bottom_nav_bar.dart';
import 'package:sickler/services/auth/auth_service.dart';

import 'core/core.dart';
import 'models/auth/sickler_user_model.dart';

///Providers
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(authService: authService);
final authProvider =
    AsyncNotifierProvider.autoDispose<AuthProviderNotifier, SicklerUser?>(
        () => AuthProviderNotifier(authRepository: authRepository));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {

    super.initState();
  }


  @override
  void didChangeDependencies() {
   // ref.watch(authProvider.notifier).authStateChanges();
   // appRouter = AppRouter(ref: ref);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Sickler',
      debugShowCheckedModeBanner: false,
      theme: SicklerThemeData.lightTheme,
      darkTheme: SicklerThemeData.darkTheme,
      themeMode: ThemeMode.system,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
     //home: ref.watch(authProvider.notifier).authState == AuthState.authenticated ? BottomNavBar(): SignInScreen(),
      routerConfig: router,

    );
  }
}
