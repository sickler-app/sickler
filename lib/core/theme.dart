import 'package:flutter/material.dart';
import 'core.dart';

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
      displayLarge:
          SicklerTextStyles.displayLarge.copyWith(color: SicklerColours.black),
      displayMedium:
          SicklerTextStyles.displayMedium.copyWith(color: SicklerColours.black),
      displaySmall:
          SicklerTextStyles.displaySmall.copyWith(color: SicklerColours.black),

      ///
      headlineLarge:
          SicklerTextStyles.headlineLarge.copyWith(color: SicklerColours.black),
      headlineSmall:
          SicklerTextStyles.headlineSmall.copyWith(color: SicklerColours.black),
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
    cardColor: SicklerColours.purple95,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => const Size.fromHeight(52),
        ),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(horizontal: 16)),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return 0;
          } else if (states.contains(MaterialState.focused)) {
            return 0;
          } else if (states.contains(MaterialState.error)) {
            return 0;
          } else if (states.contains(MaterialState.dragged)) {
            return 0;
          } else if (states.contains(MaterialState.hovered)) {
            return 0;
          } else if (states.contains(MaterialState.pressed)) {
            return 0;
          } else if (states.contains(MaterialState.scrolledUnder)) {
            return 0;
          } else if (states.contains(MaterialState.selected)) {
            return 0;
          }
          return 0;
        }),
      ),
    ),
    sliderTheme: const SliderThemeData(
        activeTickMarkColor: SicklerColours.purple40,
        inactiveTrackColor: SicklerColours.neutral90,
        trackHeight: 4,
        trackShape: RoundedRectSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(
          elevation: 0,
          enabledThumbRadius: 18,
          disabledThumbRadius: 4,
          pressedElevation: 0,
        ),
        thumbColor: SicklerColours.white,
        overlayColor: Colors.transparent,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: SicklerColours.purpleSeed,
      primary: SicklerColours.purple40,
      onPrimary: SicklerColours.white,
      primaryContainer: SicklerColours.purple90,
      onPrimaryContainer: SicklerColours.purple10,
      error: SicklerColours.red50,
    ),
  );

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
      // cardColor: SicklerColours.purple10.withOpacity(.8),
      // cardColor: SicklerColours.purple10.withOpacity(.8),
      cardColor: SicklerColours.neutral20,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => const Size.fromHeight(52),
        ),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(horizontal: 16)),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return 0;
          } else if (states.contains(MaterialState.focused)) {
            return 0;
          } else if (states.contains(MaterialState.error)) {
            return 0;
          } else if (states.contains(MaterialState.dragged)) {
            return 0;
          } else if (states.contains(MaterialState.hovered)) {
            return 0;
          } else if (states.contains(MaterialState.pressed)) {
            return 0;
          } else if (states.contains(MaterialState.scrolledUnder)) {
            return 0;
          } else if (states.contains(MaterialState.selected)) {
            return 0;
          }
          return 0;
        }),
      )),
      sliderTheme: const SliderThemeData(
          activeTickMarkColor: SicklerColours.purple40,
          inactiveTrackColor: SicklerColours.neutral90,
          trackHeight: 4,
          trackShape: RoundedRectSliderTrackShape(),
          thumbShape: RoundSliderThumbShape(
            elevation: 0,
            enabledThumbRadius: 18,
            disabledThumbRadius: 4,
            pressedElevation: 0,
          ),
          thumbColor: SicklerColours.white,
          overlayColor: Colors.transparent,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: SicklerColours.purpleSeed,
        primary: SicklerColours.purple70,
        onPrimary: SicklerColours.purple10,
        primaryContainer: SicklerColours.purple10.withOpacity(.8),
        onPrimaryContainer: SicklerColours.purple95,
        error: SicklerColours.red60,
        onError: SicklerColours.white,
        errorContainer: SicklerColours.red30,
        onErrorContainer: SicklerColours.red90,
      ));
}
