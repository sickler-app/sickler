import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../../core/core.dart';
part 'user_preferences.g.dart';

@Embedded(inheritance: false)
class UserPreferences extends Equatable {
  const UserPreferences(
      {this.uid,
      this.volumeUnit,
      this.lengthUnit,
      this.massUnit,
      this.isFirstTime = true,
      this.isOnboarded = false,
      this.lastUpdated,
      this.themeMode});

  //Water Preferences
  final String? uid;

  @Enumerated(EnumType.name)
  final Units? volumeUnit;
  @Enumerated(EnumType.name)
  final Units? lengthUnit;
  @Enumerated(EnumType.name)
  final Units? massUnit;

  final bool isFirstTime;
  final bool isOnboarded;

  @Enumerated(EnumType.name)
  final ThemeMode? themeMode;

  final DateTime? lastUpdated;

  ///------CopyWith---------///
  UserPreferences copyWith(
      {final String? uid,
      final Units? volumeUnit,
      final Units? lengthUnit,
      final Units? massUnit,
      final bool? isFirstTime,
      final bool? isOnboarded,
      final ThemeMode? themeMode,
      final DateTime? lastUpdated}) {
    return UserPreferences(
        uid: uid ?? this.uid,
        volumeUnit: volumeUnit ?? this.volumeUnit,
        massUnit: massUnit ?? this.massUnit,
        lengthUnit: lengthUnit ?? this.lengthUnit,
        isFirstTime: isFirstTime ?? this.isFirstTime,
        isOnboarded: isOnboarded ?? this.isOnboarded,
        themeMode: themeMode ?? this.themeMode,
        lastUpdated: lastUpdated ?? this.lastUpdated);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "uid": uid,
      "volumeUnit": volumeUnit,
      "lengthUnit": lengthUnit,
      "massUnit": massUnit,
      "isFirstTime": isFirstTime,
      "isOnboarded": isOnboarded,
      "themeMode": themeMode?.name,
      "lastUpdated": lastUpdated,
    };

    return data;
  }

  factory UserPreferences.fromMap({required Map<String, dynamic> data}) {
    return UserPreferences(
      // dailyWaterGoal: data["dailyWaterGoal"] as double?,
      // waterInputVolume: data["waterInputVolume"] as double?,
      volumeUnit: Units.values.byName(data["volumeUnit"] as String),
      massUnit: Units.values.byName(data["massUnit"] as String),
      lengthUnit: Units.values.byName(data["lengthUnit"] as String),
      isFirstTime: data["isFirstTime"] as bool,
      isOnboarded: data["isOnboarded"] as bool,
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
    return super.toString();
  }

  @ignore
  @override
  bool? get stringify => true;

  @ignore
  @override
  List<Object?> get props => [
        volumeUnit,
        lengthUnit,
        massUnit,
        themeMode,
        isFirstTime,
        isOnboarded,
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
}
