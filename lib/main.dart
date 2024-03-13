import 'package:flutter/material.dart';
import 'package:sickler/core/theme.dart';
import 'package:sickler/screens/emergency/emergency_screen.dart';
import 'package:sickler/screens/home/home_screen.dart';


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
        home: const EmergencyScreen());
  }
}
