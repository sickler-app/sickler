import 'package:equatable/equatable.dart';

class SicklerUserInfo extends Equatable {
  ///Profile Info
  final String uid;
  final String gender;
  final String fullName;
  final String? displayName;
  final int age;

  /// Health Info
  //final DateTime updatedAt;
  final int? painSeverity;
  final String? crisisFrequency;
  final String? genotype;
  final double? height;
  final double? weight;
  final double? bmi;
  final String? bloodType;
  final List<String>? allergies;
  final List<String>? medicalConditions;

  const SicklerUserInfo(
      {
      ///Profile Info
      required this.uid,
      required this.gender,
      required this.fullName,
      this.displayName,
      required this.age,

      ///Health Info
      this.crisisFrequency,
      this.painSeverity,
      this.genotype,
      this.height,
      this.weight,
      this.bmi,
      this.bloodType,
      this.allergies,
      this.medicalConditions});

  SicklerUserInfo copyWith(
      {String? uid,
      String? gender,
      String? fullName,
      String? displayName,
      int? age,
      String? genotype,
      double? height,
      double? weight,
      double? bmi,
      String? bloodType,
      int? painSeverity,
      String? crisisFrequency,
      List<String>? allergies,
      List<String>? medicalConditions}) {
    return SicklerUserInfo(

        ///Profile Info
        uid: uid ?? this.uid,
        gender: gender ?? this.gender,
        fullName: fullName ?? this.fullName,
        displayName: displayName ?? this.displayName,
        age: age ?? this.age,

        ///Health Info
        painSeverity: painSeverity ?? this.painSeverity,
        crisisFrequency: crisisFrequency ?? this.crisisFrequency,
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
    Map<String, dynamic> profileData = {
      "uid": uid,
      "gender": gender,
      "fullName": fullName,
      "displayName": displayName,
      "age": age,
    };
    Map<String, dynamic> healthData = {
      "painSeverity": painSeverity,
      "crisisFrequency": crisisFrequency,
      "genotype": genotype,
      "height": height,
      "weight": weight,
      "bmi": bmi,
      "bloodType": bloodType,
      "allergies": allergies,
      "medicalConditions": medicalConditions,
    };

    Map<String, Map<String, dynamic>> userData = {
      "profile": profileData,
      "health": healthData,
    };
    return userData;
  }

  factory SicklerUserInfo.fromMap(Map<String, dynamic> data) {
    return SicklerUserInfo(
        uid: data["profile"]["uid"] as String,
        gender: data["profile"]["gender"] as String,
        fullName: data["profile"]["fullName"] as String,
        displayName: data["profile"]["displayName"] as String?,
        age: data["profile"]["age"] as int,
        painSeverity: data["health"]["painSeverity"] as int?,
        crisisFrequency: data["health"]["crisisFrequency"] as String?,
        genotype: data["health"]["genotype"] as String?,
        height: data["health"]["height"] as double?,
        weight: data["health"]["weight"] as double?,
        bmi: data["health"]["bmi"] as double?,
        bloodType: data["health"]["bloodType"] as String?,
        allergies: data["health"]["allergies"] as List<String>,
        medicalConditions: data["health"]["medicalConditions"] as List<String>);
  }

  ///
  double? calculateBMI() {
    if (height != null && weight != null) {
      return weight! / ((height! / 100) * (height! / 100));
    } else {
      return null;
    }
  }

  ///-------------Empty----------///

  static SicklerUserInfo empty = const SicklerUserInfo(
      uid: "",
      genotype: "",
      height: 0,
      weight: 0,
      bmi: 0,
      bloodType: "",
      allergies: [],
      medicalConditions: [],
      gender: "",
      fullName: "",
      age: 0,
      displayName: "");

  bool get isEmpty => this == SicklerUserInfo.empty;
  bool get isNotEmpty => this != SicklerUserInfo.empty;

  ///Todo:Redo ToString Override

  @override
  String toString() {
    return """SicklerUserInfo(
      uid: $uid,
      gender: $gender,
      fullName: $fullName,
      displayName: $displayName,
      age: $age,
      painSeverity: $painSeverity,
      crisisFrequency: $crisisFrequency,
      genotype: $genotype,
      height: $height,
      weight: $weight,
      bmi: $bmi,
      bloodType: $bloodType,
      allergies: $allergies,
      medicalConditions: $medicalConditions,
    );""";
  }

  @override
  List<Object?> get props => [
        uid,
        fullName,
        displayName,
        age,
        gender,
        genotype,
        height,
        weight,
        bmi,
        bloodType,
        allergies,
        medicalConditions
      ];
}
