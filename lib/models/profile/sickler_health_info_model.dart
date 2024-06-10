import 'package:equatable/equatable.dart';

class SicklerHealthInfo extends Equatable {
  final String? genotype;
  final String? height;
  final String? weight;
  final String? bmi;
  final String? bloodType;
  final List<String>? allergies;
  final List<String>? medicalConditions;

  const SicklerHealthInfo(
      {this.genotype,
      this.height,
      this.weight,
      this.bmi,
      this.bloodType,
      this.allergies,
      this.medicalConditions});

  SicklerHealthInfo copyWith(
      {String? genotype,
      String? height,
      String? weight,
      String? bmi,
      String? bloodType,
      List<String>? allergies,
      List<String>? medicalConditions}) {
    return SicklerHealthInfo(
        genotype: genotype ?? this.genotype,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        bmi: bmi ?? this.bmi,
        bloodType: bloodType ?? this.bloodType,
        allergies: allergies ?? this.allergies,
        medicalConditions: medicalConditions ?? this.medicalConditions);
  }

  ///-----To and From Map-------///

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "genotype": genotype,
      "height": height,
      "weight": weight,
      "bmi": bmi,
      "bloodType": bloodType,
      "allergies": allergies,
      "medicalConditions": medicalConditions
    };
    return data;
  }

  factory SicklerHealthInfo.fromMap(Map<String, dynamic> data) {
    return SicklerHealthInfo(
        genotype: data["genotype"],
        height: data["height"],
        weight: data["weight"],
        bmi: data["bmi"],
        bloodType: data["bloodType"],
        allergies: data["allergies"],
        medicalConditions: data["medicalConditions"]);
  }

  ///-------------Empty----------///

  static SicklerHealthInfo empty = const SicklerHealthInfo(
      genotype: "",
      height: "",
      weight: "",
      bmi: "",
      bloodType: "",
      allergies: [],
      medicalConditions: []);

  bool get isEmpty => this == SicklerHealthInfo.empty;
  bool get isNotEmpty => this != SicklerHealthInfo.empty;

  @override
  String toString() {
    return 'SicklerHealthInfo(genotype: $genotype, height: $height, weight: $weight, bmi: $bmi, bloodType: $bloodType, allergies: $allergies, medicalConditions: $medicalConditions)';
  }

  @override
  List<Object?> get props =>
      [genotype, height, weight, bmi, bloodType, allergies, medicalConditions];
}
