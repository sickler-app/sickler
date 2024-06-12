import 'package:equatable/equatable.dart';

class SicklerUserHealthInfo extends Equatable {
  final String uid;
  final String? genotype;
  final String? height;
  final String? weight;
  final String? bmi;
  final String? bloodType;
  final List<String>? allergies;
  final List<String>? medicalConditions;

  const SicklerUserHealthInfo(
      {required this.uid,
      this.genotype,
      this.height,
      this.weight,
      this.bmi,
      this.bloodType,
      this.allergies,
      this.medicalConditions});

  SicklerUserHealthInfo copyWith(
      {String? uid,
      String? genotype,
      String? height,
      String? weight,
      String? bmi,
      String? bloodType,
      List<String>? allergies,
      List<String>? medicalConditions}) {
    return SicklerUserHealthInfo(
        uid: uid ?? this.uid,
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
      "uid": uid,
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

  factory SicklerUserHealthInfo.fromMap(Map<String, dynamic> data) {
    return SicklerUserHealthInfo(
        uid: data["uid"],
        genotype: data["genotype"],
        height: data["height"],
        weight: data["weight"],
        bmi: data["bmi"],
        bloodType: data["bloodType"],
        allergies: data["allergies"],
        medicalConditions: data["medicalConditions"]);
  }

  ///-------------Empty----------///

  static SicklerUserHealthInfo empty = const SicklerUserHealthInfo(
      uid: "",
      genotype: "",
      height: "",
      weight: "",
      bmi: "",
      bloodType: "",
      allergies: [],
      medicalConditions: []);

  bool get isEmpty => this == SicklerUserHealthInfo.empty;
  bool get isNotEmpty => this != SicklerUserHealthInfo.empty;

  @override
  String toString() {
    return 'SicklerHealthInfo(genotype: $genotype, height: $height, weight: $weight, bmi: $bmi, bloodType: $bloodType, allergies: $allergies, medicalConditions: $medicalConditions)';
  }

  @override
  List<Object?> get props => [
        uid,
        genotype,
        height,
        weight,
        bmi,
        bloodType,
        allergies,
        medicalConditions
      ];
}
