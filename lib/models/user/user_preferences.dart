import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'user_preferences.g.dart';

enum Units {
  ///Mass Measurement Units
  pound,
  ounce,
  kilogram,
  gram,
  milligram,

  /// Length measurement units
  kilometres,
  metres,
  centimetres,
  millimetres,
  miles,
  inches,
  feet,

  ///Volume measurement units
  litres,
  millilitres,
  centilitres,
  gallons,
}

@Collection(inheritance: false)
class UserPreferences extends Equatable {
  const UserPreferences(
      {this.dailyWaterGoal,
      this.waterInputVolume,
      this.volumeUnit,
      this.lengthUnit,
      this.massUnit,
      this.isFirstTime,
      this.isOnboarded,
      this.themeMode});

  final Id id = Isar.autoIncrement;

  //Water Preferences
  final double? dailyWaterGoal;
  final double? waterInputVolume;

  @Enumerated(EnumType.name)
  final Units? volumeUnit;
  @Enumerated(EnumType.name)
  final Units? lengthUnit;
  @Enumerated(EnumType.name)
  final Units? massUnit;

  // Water bool
  final bool? isFirstTime;
  final bool? isOnboarded;

  @Enumerated(EnumType.name)
  final ThemeMode? themeMode;

  ///------CopyWith---------///

  @ignore
  @override
  List<Object?> get props => [
        id,
        dailyWaterGoal,
        waterInputVolume,
        volumeUnit,
        lengthUnit,
        massUnit,
        themeMode,
        isFirstTime,
        isOnboarded,
      ];
}
