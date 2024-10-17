import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../../core/core.dart';

part 'water_log.g.dart';

@Collection(inheritance: false)
class WaterLog extends Equatable {
  final Id id;
  final DateTime timestamp;
  final double amount;
  @Enumerated(EnumType.name)
  final Units unit;

  const WaterLog({
    this.id = Isar.autoIncrement,
    required this.timestamp,
    required this.amount,
    this.unit = Units.millilitres,
  });

  WaterLog copyWith({
    DateTime? timestamp,
    double? amount,
    Units? unit,
  }) {
    return WaterLog(
      timestamp: timestamp ?? this.timestamp,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'amount': amount,
      'unit': unit.symbol
    };
  }

  factory WaterLog.fromMap(Map<String, dynamic> map) {
    return WaterLog(
      timestamp: DateTime.parse(map['timestamp']),
      amount: map['amount'] as double,
      unit: Units.values.byName(map['unit'] as String),
    );
  }

  @ignore
  static WaterLog empty = WaterLog(
      timestamp: DateTime(0, 0, 0, 0), amount: 0, unit: Units.millilitres);

  @ignore
  bool get isEmpty => this == WaterLog.empty;

  @ignore
  bool get isNotEmpty => this != WaterLog.empty;
  @override
  String toString() {
    if (this == WaterLog.empty) {
      return 'WaterLog.empty';
    }
    return super.toString();
  }

  @ignore
  @override
  bool? get stringify => true;

  @ignore
  @override
  List<Object?> get props => [timestamp, amount, unit, id];
}
