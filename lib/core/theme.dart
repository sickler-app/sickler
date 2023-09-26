import 'package:flutter/material.dart';
import 'package:sickler/core/constants.dart';

class SicklerThemeData {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primaryColor: SicklerColours.purple40,
      primaryColorLight: SicklerColours.purple50,
      primaryColorDark: SicklerColours.purple30,
      scaffoldBackgroundColor: SicklerColours.white,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: SicklerColours.black),
      primaryIconTheme: const IconThemeData(color: SicklerColours.black),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      fontFamily: 'Plus Jakarta Sans',
      textTheme: TextTheme(
        displayLarge: SicklerTextStyles.displayLarge
            .copyWith(color: SicklerColours.black),
        displayMedium: SicklerTextStyles.displayMedium
            .copyWith(color: SicklerColours.black),
        displaySmall: SicklerTextStyles.displaySmall
            .copyWith(color: SicklerColours.black),

        ///
        headlineLarge: SicklerTextStyles.headlineLarge
            .copyWith(color: SicklerColours.black),
        headlineSmall: SicklerTextStyles.headlineSmall
            .copyWith(color: SicklerColours.black),
        headlineMedium: SicklerTextStyles.headlineMedium
            .copyWith(color: SicklerColours.black),

        ///
        titleLarge:
            SicklerTextStyles.titleLarge.copyWith(color: SicklerColours.black),
        titleMedium:
            SicklerTextStyles.titleMedium.copyWith(color: SicklerColours.black),
        titleSmall:
            SicklerTextStyles.titleSmall.copyWith(color: SicklerColours.black),

        ///
        bodyLarge:
            SicklerTextStyles.bodyLarge.copyWith(color: SicklerColours.black),
        bodyMedium:
            SicklerTextStyles.bodyMedium.copyWith(color: SicklerColours.black),
        bodySmall:
            SicklerTextStyles.bodySmall.copyWith(color: SicklerColours.black),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: SicklerColours.purpleSeed,
      ));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: SicklerColours.purple80,
      primaryColorLight: SicklerColours.purple90,
      primaryColorDark: SicklerColours.purple70,
      scaffoldBackgroundColor: SicklerColours.black,
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: SicklerColours.white),
      primaryIconTheme: const IconThemeData(color: SicklerColours.white),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      fontFamily: 'Plus Jakarta Sans',
      textTheme: TextTheme(
        displayLarge: SicklerTextStyles.displayLarge
            .copyWith(color: SicklerColours.white),
        displayMedium: SicklerTextStyles.displayMedium
            .copyWith(color: SicklerColours.white),
        displaySmall: SicklerTextStyles.displaySmall
            .copyWith(color: SicklerColours.white),

        ///
        headlineLarge: SicklerTextStyles.headlineLarge
            .copyWith(color: SicklerColours.white),
        headlineSmall: SicklerTextStyles.headlineSmall
            .copyWith(color: SicklerColours.white),
        headlineMedium: SicklerTextStyles.headlineMedium
            .copyWith(color: SicklerColours.white),

        ///
        titleLarge:
            SicklerTextStyles.titleLarge.copyWith(color: SicklerColours.white),
        titleMedium:
            SicklerTextStyles.titleMedium.copyWith(color: SicklerColours.white),
        titleSmall:
            SicklerTextStyles.titleSmall.copyWith(color: SicklerColours.white),

        ///
        bodyLarge:
            SicklerTextStyles.bodyLarge.copyWith(color: SicklerColours.white),
        bodyMedium:
            SicklerTextStyles.bodyMedium.copyWith(color: SicklerColours.white),
        bodySmall:
            SicklerTextStyles.bodySmall.copyWith(color: SicklerColours.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: SicklerColours.purpleSeed,
      ));
}
