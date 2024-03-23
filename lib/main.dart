import 'package:flutter/material.dart';
import 'package:sickler/core/theme.dart';
import 'package:sickler/screens/profile/settings_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        home: const SettingsScreen());
  }
}
