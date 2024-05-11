import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/core/routes.dart';
import 'package:sickler/core/theme.dart';
import 'package:sickler/providers/auth/auth_provider.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/services/auth/auth_service.dart';

import 'models/auth/sickler_user_model.dart';

///Providers
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(authService: authService);
final authProvider =
    AsyncNotifierProvider.autoDispose<AuthProviderNotifier, SicklerUser?>(
        () => AuthProviderNotifier(authRepository: authRepository));

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

final AppRouter appRouter = AppRouter();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return MaterialApp(
      title: 'Sickler',
      debugShowCheckedModeBanner: false,
      theme: SicklerThemeData.lightTheme,
      darkTheme: SicklerThemeData.darkTheme,
      themeMode: ThemeMode.system,
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
    //  routerConfig: appRouter.router,
      home: SignInScreen(),
    );
  }
}
