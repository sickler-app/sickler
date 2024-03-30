import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core.dart';

class SicklerThemeData {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: SicklerColours.purpleSeed,
    primaryColorLight: SicklerColours.purple50,
    primaryColorDark: SicklerColours.purple30,
    scaffoldBackgroundColor: SicklerColours.white,
    iconTheme: const IconThemeData(color: SicklerColours.black),
    primaryIconTheme: const IconThemeData(color: SicklerColours.black),
    cardTheme: CardTheme(
      color: SicklerColours.purple95,
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent),
    cardColor: SicklerColours.purple95,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkSparkle.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(52)),
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16)),
        elevation: MaterialStatePropertyAll<double>(0),
      ),

    ),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll<double>(0),
          splashFactory: InkSparkle.splashFactory,
        )
    ),
    chipTheme: ChipThemeData(
      labelStyle:
          SicklerTextStyles.bodyMedium.copyWith(color: SicklerColours.purple10),
      elevation: 0,
      selectedColor: SicklerColours.purple90,
      backgroundColor: SicklerColours.neutral95,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
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
    switchTheme: SwitchThemeData(
      thumbColor: const MaterialStatePropertyAll<Color>(SicklerColours.white),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return SicklerColours.purple40;
        }
        return SicklerColours.purple90;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return SicklerColours.purple40;
        }
        return SicklerColours.purple90;
      }),
      trackOutlineWidth: const MaterialStatePropertyAll<double>(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: SicklerColours.purpleSeed,
      primary: SicklerColours.purple40,
      onPrimary: SicklerColours.white,
      primaryContainer: SicklerColours.purple90,
      onPrimaryContainer: SicklerColours.purple10,
      secondary: SicklerColours.orangeSeed,
      onSecondary: SicklerColours.white,
      secondaryContainer: SicklerColours.orange95,
      error: SicklerColours.red50,
      onError: SicklerColours.white,
      errorContainer: SicklerColours.red95,
      onErrorContainer: SicklerColours.red10,
    ),
  );

  ///--------Dark Theme-------///
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: SicklerColours.purple70,
    primaryColorLight: SicklerColours.purple90,
    primaryColorDark: SicklerColours.purple70,

    scaffoldBackgroundColor: SicklerColours.black,
    iconTheme: const IconThemeData(color: SicklerColours.white),
    primaryIconTheme: const IconThemeData(color: SicklerColours.white),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return SicklerColours.purple10;
        }
        return SicklerColours.neutral70;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return SicklerColours.purple70;
        }
        return SicklerColours.neutral20;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return SicklerColours.purple70;
        }
        return SicklerColours.neutral20;
      }),
      trackOutlineWidth: const MaterialStatePropertyAll<double>(0),
    ),
    cardTheme: CardTheme(
      color: SicklerColours.neutral20,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    fontFamily: 'Plus Jakarta Sans',
    textTheme: TextTheme(
      displayLarge:
          SicklerTextStyles.displayLarge.copyWith(color: SicklerColours.white),
      displayMedium:
          SicklerTextStyles.displayMedium.copyWith(color: SicklerColours.white),
      displaySmall:
          SicklerTextStyles.displaySmall.copyWith(color: SicklerColours.white),

      ///
      headlineLarge:
          SicklerTextStyles.headlineLarge.copyWith(color: SicklerColours.white),
      headlineSmall:
          SicklerTextStyles.headlineSmall.copyWith(color: SicklerColours.white),
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
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    cardColor: SicklerColours.neutral20,
    elevatedButtonTheme: const ElevatedButtonThemeData(

      style: ButtonStyle(
        splashFactory: InkSparkle.splashFactory,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: MaterialStatePropertyAll<Size>(Size.fromHeight(52)),
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16)),
        elevation: MaterialStatePropertyAll<double>(0),
      ),
    ),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll<double>(0),
          splashFactory: InkSparkle.splashFactory,
        )
    ),
    chipTheme: ChipThemeData(
      elevation: 0,
      selectedColor: SicklerColours.purple70,
      backgroundColor: SicklerColours.neutral20,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    ),
    sliderTheme: const SliderThemeData(
        activeTickMarkColor: SicklerColours.purple40,
        inactiveTrackColor: SicklerColours.neutral90,
        trackHeight: 2,
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
      primaryContainer: SicklerColours.purple10,
      onPrimaryContainer: SicklerColours.purple95,
      secondary: SicklerColours.orange70,
      onSecondary: SicklerColours.black,
      secondaryContainer: SicklerColours.orange10,
      error: SicklerColours.red60,
      onError: SicklerColours.white,
      errorContainer: SicklerColours.red10,
      onErrorContainer: SicklerColours.red90,
    ),
  );
}
