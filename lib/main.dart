import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/routes.dart';
import 'package:sickler/core/theme.dart';
import 'package:sickler/firebase_options.dart';

import 'core/core.dart';
import 'features/water/water.dart';

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
  GoRouter? router;
  @override
  void initState() {
    router = ref.read(routerProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkMode
          ? SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light
              .copyWith(statusBarColor: Colors.transparent),
      child: MaterialApp(
        title: 'Sickler',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lightTheme,
        darkTheme: AppThemeData.darkTheme,
        themeMode: ThemeMode.system,
        themeAnimationStyle: AnimationStyle(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        ),
        home: const WaterScreen(),

        //  routerConfig: router,
        //  home: const OnboardingBaseScreen(),
      ),
    );
  }
}
