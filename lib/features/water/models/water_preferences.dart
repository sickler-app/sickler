import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../../core/core.dart';

part 'water_preferences.g.dart';

@Collection(inheritance: false)
class WaterPreferences extends Equatable {
  final Id id = 1;
  final int? dailyGoal;
  @Enumerated(EnumType.name)
  final Units? unit;
  final int? logAmount;

  const WaterPreferences({
    this.dailyGoal,
    this.unit,
    this.logAmount,
  });

  const WaterPreferences.initial({
    this.dailyGoal = 2000,
    this.unit = Units.millilitres,
    this.logAmount = 250,
  });

  WaterPreferences copyWith({int? dailyGoal, Units? unit, int? logAmount}) {
    return WaterPreferences(
      dailyGoal: dailyGoal ?? this.dailyGoal,
      unit: unit ?? this.unit,
      logAmount: logAmount ?? this.logAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dailyGoal': dailyGoal,
      'unit': unit?.symbol,
      'logAmount': logAmount,
    };
  }

  factory WaterPreferences.fromMap(Map<String, dynamic> data) {
    return WaterPreferences(
      dailyGoal: data["dailyGoal"],
      unit: Units.values.byName(data["unit"]),
      logAmount: data["logAmount"],
    );
  }

  static const empty = WaterPreferences();
  @ignore
  bool get isEmpty => this == WaterPreferences.empty;
  @ignore
  bool get isNotEmpty => this != WaterPreferences.empty;

  @override
  String toString() {
    if (this == WaterPreferences.empty) {
      return "WaterPreferences.empty";
    }

    return super.toString();
  }

  @ignore
  @override
  bool? get stringify => true;

  @ignore
  @override
  List<Object?> get props => [dailyGoal, unit, logAmount];
}
