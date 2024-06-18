import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/routes.dart';
import 'package:sickler/core/theme.dart';
import 'package:sickler/firebase_options.dart';

import 'core/core.dart';
import 'providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.white));

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  GoRouter? router;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(currentUserStreamProvider);
      await ref
          .watch(userPreferencesProvider.notifier)
          .getUserPreferences()
          .then((_) {
        router = ref.watch(routerProvider);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("printing state of authProvider");
      print(ref.watch(authProvider).value);
    }

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
      routerConfig: router ?? ref.watch(routerProvider),
      // home: BlobScreen(),
    );
  }
}
