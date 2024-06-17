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

@Collection(inheritance: false)
class UserPreferences extends Equatable {
  const UserPreferences(
      {required this.uid,
      this.dailyWaterGoal,
      this.waterInputVolume,
      this.volumeUnit,
      this.lengthUnit,
      this.massUnit,
      this.isFirstTime,
      this.isOnboarded,
      this.themeMode});

  final Id id = Isar
      .autoIncrement; //Keeping it final because we want only 1 user preferences object, might as well just put a fixed id like '0';

  //Water Preferences
  final double? dailyWaterGoal;
  final double? waterInputVolume;
  final String uid;

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
  UserPreferences copyWith({
    final String? uid,
    final double? dailyWaterGoal,
    final double? waterInputVolume,
    final Units? volumeUnit,
    final Units? lengthUnit,
    final Units? massUnit,
    final bool? isFirstTime,
    final bool? isOnboarded,
    final ThemeMode? themeMode,
  }) {
    return UserPreferences(
      uid: uid ?? this.uid,
      dailyWaterGoal: dailyWaterGoal ?? this.dailyWaterGoal,
      waterInputVolume: waterInputVolume ?? this.waterInputVolume,
      volumeUnit: volumeUnit ?? this.volumeUnit,
      massUnit: massUnit ?? this.massUnit,
      lengthUnit: lengthUnit ?? this.lengthUnit,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isOnboarded: isOnboarded ?? this.isOnboarded,
    );
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
      "isOnboarded": isOnboarded,
      "themeMode": themeMode,
    };

    return data;
  }

  factory UserPreferences.fromMap({required Map<String, dynamic> data}) {
    return UserPreferences(
      uid: data["uid"] as String,
      dailyWaterGoal: data["dailyWaterGoal"] as double?,
      waterInputVolume: data["waterInputVolume"] as double?,
      volumeUnit: (data["volumeUnit"] as String).convertToUnit(),
      massUnit: (data["massUnit"] as String).convertToUnit(),
      lengthUnit: (data["lengthUnit"] as String).convertToUnit(),
      isFirstTime: data["isFirstTime"] as bool,
      isOnboarded: data["isOnboarded"] as bool,
      themeMode: (data["themeMode"] as String).convertToThemeMode(),
    );
  }

  static UserPreferences empty = const UserPreferences(
    uid: "",
    dailyWaterGoal: null,
    waterInputVolume: null,
    volumeUnit: null,
    lengthUnit: null,
    massUnit: null,
    isFirstTime: null,
    isOnboarded: null,
    themeMode: null,
  );

  bool get isEmpty => this == UserPreferences.empty;

  bool get isNotEmpty => this != UserPreferences.empty;

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
