import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

///-------Paddings--------///
const double kDefaultPadding = 16.0;
const double kDefaultPaddingLarge = 24.0;

///------Input Decorations-------///
class SicklerInputDecoration {
  static InputDecoration inputDecoration = InputDecoration(
      errorStyle:
          SicklerTextStyles.bodyMedium.copyWith(color: SicklerColours.red50),
      errorBorder: OutlineInputBorder(
        gapPadding: 4,
        borderSide: const BorderSide(color: SicklerColours.red50, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(
        gapPadding: 0,
        borderSide: const BorderSide(width: 1, color: SicklerColours.purple40),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        gapPadding: 0,
        borderSide: const BorderSide(width: 0, color: SicklerColours.purple40),
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        gapPadding: 0,
        borderSide: const BorderSide(width: 0, color: SicklerColours.neutral95),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        gapPadding: 0,
        borderSide: const BorderSide(width: 1, color: SicklerColours.purple40),
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      isDense: true,
      fillColor: SicklerColours.purple95,
      hintStyle: SicklerTextStyles.bodyMedium
          .copyWith(color: SicklerColours.neutral50),
      labelStyle:
          SicklerTextStyles.bodyMedium.copyWith(color: SicklerColours.black));
}

///------Colours-------///
class SicklerColours {
  static const Color black = Color(0xFF1C1A22);
  static const Color white = Color(0xFFFFFBFF);

  ///-----------Purple---------///
  static const Color purpleSeed = Color(0xFF7B4FFF);
  static const Color purple10 = Color(0xFF1F0060);
  static const Color purple20 = Color(0xFF350097);
  static const Color purple30 = Color(0xFF4E00D2);
  static const Color purple40 = Color(0xFF6635E9);
  static const Color purple50 = Color(0xFF7F56FF);
  static const Color purple60 = Color(0xFF987BFF);
  static const Color purple70 = Color(0xFFB29DFF);
  static const Color purple80 = Color(0xFFCCBDFF);
  static const Color purple90 = Color(0xFFCCBDFF);
  static const Color purple95 = Color(0xFFF5EEFF);
  static const Color purple99 = Color(0xFFFFFBFF);

  ///-----------Orange---------///
  static const Color orangeSeed = Color(0xFFFE764A);
  static const Color orange10 = Color(0xFF3A0B00);
  static const Color orange20 = Color(0xFF5E1700);
  static const Color orange30 = Color(0xFF852400);
  static const Color orange40 = Color(0xFFA83810);
  static const Color orange50 = Color(0xFFCA5027);
  static const Color orange60 = Color(0xFFEC693E);
  static const Color orange70 = Color(0xFFFF8B67);
  static const Color orange80 = Color(0xFFFFB59E);
  static const Color orange90 = Color(0xFFFFDBD0);
  static const Color orange95 = Color(0xFFFFEDE8);
  static const Color orange99 = Color(0xFFFFFBFF);

  ///-----------Green---------///
  static const Color greenSeed = Color(0xFF07DD83);
  static const Color green10 = Color(0xFF00210F);
  static const Color green20 = Color(0xFF00391D);
  static const Color green30 = Color(0xFF00522D);
  static const Color green40 = Color(0xFF006D3E);
  static const Color green50 = Color(0xFF00894F);
  static const Color green60 = Color(0xFF00A661);
  static const Color green70 = Color(0xFF00C473);
  static const Color green80 = Color(0xFF1CE288);
  static const Color green90 = Color(0xFF59FFA4);
  static const Color green95 = Color(0xFFC2FFD2);
  static const Color green99 = Color(0xFFF5FFF4);

  ///-----------Red---------///
  static const Color redSeed = Color(0xFFF5043E);
  static const Color red10 = Color(0xFF400009);
  static const Color red20 = Color(0xFF680014);
  static const Color red30 = Color(0xFF920021);
  static const Color red40 = Color(0xFFBF002E);
  static const Color red50 = Color(0xFFEE003B);
  static const Color red60 = Color(0xFFFF525F);
  static const Color red70 = Color(0xFFFF888B);
  static const Color red80 = Color(0xFFFFB3B3);
  static const Color red90 = Color(0xFFFFDAD9);
  static const Color red95 = Color(0xFFFFEDEC);
  static const Color red99 = Color(0xFFFFFBFF);

  ///-----------Blue---------///
  static const Color blueSeed = Color(0xFF1CA8FF);
  static const Color blue10 = Color(0xFF001D32);
  static const Color blue20 = Color(0xFF003353);
  static const Color blue30 = Color(0xFF004A76);
  static const Color blue40 = Color(0xFF00639A);
  static const Color blue50 = Color(0xFF007DC1);
  static const Color blue60 = Color(0xFF0097E9);
  static const Color blue70 = Color(0xFF4FB2FF);
  static const Color blue80 = Color(0xFF96CCFF);
  static const Color blue90 = Color(0xFFCEE5FF);
  static const Color blue95 = Color(0xFFE8F2FF);
  static const Color blue99 = Color(0xFFFCFCFF);

  ///-----------Neutral---------///
  static const Color neutral10 = Color(0xFF1C1B1E);
  static const Color neutral20 = Color(0xFF313033);
  static const Color neutral30 = Color(0xFF48464A);
  static const Color neutral40 = Color(0xFF605D62);
  static const Color neutral50 = Color(0xFF79767A);
  static const Color neutral60 = Color(0xFF938F94);
  static const Color neutral70 = Color(0xFFAEAAAF);
  static const Color neutral80 = Color(0xFFCAC4CF);
  static const Color neutral90 = Color(0xFFE6E1E6);
  static const Color neutral95 = Color(0xFFF4EFF4);
  static const Color neutral99 = Color(0xFFFFFBFF);
}

///------Text Styles-------///
class SicklerTextStyles {
  ///---Display---//
  static TextStyle displayLargeBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 57,
  );

  static TextStyle displayLarge = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 57,
  );

  static TextStyle displayMediumBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 45,
  );

  static TextStyle displayMedium = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 45,
  );
  static TextStyle displaySmallBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  static TextStyle displaySmall = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 36,
  );

  ///---Headline---///
  static TextStyle headlineLarge = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 32,
  );
  static TextStyle headlineMedium = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 28,
  );
  static TextStyle headlineSmall = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 24,
  );

  ///---Title---///
  static TextStyle titleLargeBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static TextStyle titleLarge = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 22,
  );

  static TextStyle titleMediumBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static TextStyle titleMedium = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static TextStyle titleSmallBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  static TextStyle titleSmall = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  ///---Body---///
  static TextStyle bodyLargeBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static TextStyle bodyLarge = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static TextStyle bodyMediumBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  static TextStyle bodyMedium = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static TextStyle bodySmallBold = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static TextStyle bodySmall = GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
}
