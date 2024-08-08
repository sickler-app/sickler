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
  gallons;
}

@Embedded(inheritance: false)
class UserPreferences extends Equatable {
  const UserPreferences(
      {this.uid,
      this.dailyWaterGoal,
      this.waterInputVolume,
      this.volumeUnit,
      this.lengthUnit,
      this.massUnit,
      this.isFirstTime = true,
      this.isOnboardingComplete = false,
      this.lastUpdated,
      this.themeMode});

  //Water Preferences
  final double? dailyWaterGoal;
  final double? waterInputVolume;
  final String? uid;

  @Enumerated(EnumType.name)
  final Units? volumeUnit;
  @Enumerated(EnumType.name)
  final Units? lengthUnit;
  @Enumerated(EnumType.name)
  final Units? massUnit;

  final bool isFirstTime;
  //final bool isOnboarding;
  final bool isOnboardingComplete;

  @Enumerated(EnumType.name)
  final ThemeMode? themeMode;

  final DateTime? lastUpdated;

  ///------CopyWith---------///
  UserPreferences copyWith(
      {final String? uid,
      final double? dailyWaterGoal,
      final double? waterInputVolume,
      final Units? volumeUnit,
      final Units? lengthUnit,
      final Units? massUnit,
      final bool? isFirstTime,
      final bool? isOnboardingComplete,
      final ThemeMode? themeMode,
      final DateTime? lastUpdated}) {
    return UserPreferences(
        uid: uid ?? this.uid,
        dailyWaterGoal: dailyWaterGoal ?? this.dailyWaterGoal,
        waterInputVolume: waterInputVolume ?? this.waterInputVolume,
        volumeUnit: volumeUnit ?? this.volumeUnit,
        massUnit: massUnit ?? this.massUnit,
        lengthUnit: lengthUnit ?? this.lengthUnit,
        isFirstTime: isFirstTime ?? this.isFirstTime,
        isOnboardingComplete: isOnboardingComplete ?? this.isOnboardingComplete,
        themeMode: themeMode ?? this.themeMode,
        lastUpdated: lastUpdated ?? this.lastUpdated);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "uid": uid,
      "dailyWaterGoal": dailyWaterGoal,
      "waterInputVolume": waterInputVolume,
      "volumeUnit": volumeUnit,
      "lengthUnit": lengthUnit,
      "massUnit": massUnit,
      "isFirstTime": isFirstTime,
      "isOnboardingComplete": isOnboardingComplete,
      "themeMode": themeMode?.name,
      "lastUpdated": lastUpdated,
    };

    return data;
  }

  factory UserPreferences.fromMap({required Map<String, dynamic> data}) {
    return UserPreferences(
      dailyWaterGoal: data["dailyWaterGoal"] as double?,
      waterInputVolume: data["waterInputVolume"] as double?,
      volumeUnit: Units.values.byName(data["volumeUnit"] as String),
      massUnit: Units.values.byName(data["massUnit"] as String),
      lengthUnit: Units.values.byName(data["lengthUnit"] as String),
      isFirstTime: data["isFirstTime"] as bool,
      isOnboardingComplete: data["isOnboardingComplete"] as bool,
      themeMode: ThemeMode.values.byName(data["themeMode"] as String),
      lastUpdated: DateTime.parse(data["lastUpdated"]),
    );
  }

  static const UserPreferences empty = UserPreferences();

  @ignore
  bool get isEmpty => this == UserPreferences.empty;
  @ignore
  bool get isNotEmpty => this != UserPreferences.empty;

  @override
  String toString() {
    if (this == UserPreferences.empty) {
      return "UserPreferences.empty";
    }

    return "UserPreferences(uid: $uid, dailyWaterGoal: $dailyWaterGoal, waterInputVolume: $waterInputVolume, volumeUnit: $volumeUnit, massUnit: $massUnit, lengthUnit: $lengthUnit, isFirstTime: $isFirstTime, isOnboardingComplete: $isOnboardingComplete,)";
  }

  @ignore
  @override
  List<Object?> get props => [
        dailyWaterGoal,
        waterInputVolume,
        volumeUnit,
        lengthUnit,
        massUnit,
        themeMode,
        isFirstTime,
        isOnboardingComplete,
        lastUpdated,
      ];
}

extension UnitToString on Units {
  String toCleanString() {
    /// Figure out a away to clean this unit string
    return toString().split('(').last.split(')').first;
  }
}

extension StringToUnits on String {
  Units? convertToUnit() {
    if (isEmpty) return null;
    return Units.values.firstWhere((element) =>
        element.toCleanString().contains(this) || element.toString() == this);
  }

  ThemeMode? convertToThemeMode() {
    if (isEmpty) return null;
    return ThemeMode.values.firstWhere((element) =>
        element.toString().contains(this) || element.toString() == this);
  }
}
