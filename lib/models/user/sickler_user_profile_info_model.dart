import 'package:equatable/equatable.dart';

class SicklerUserProfileInfo extends Equatable {
  final String uid;
  final String gender;
  final String fullName;
  final String displayName;
  final int age;

  const SicklerUserProfileInfo(
      {required this.uid,
      required this.gender,
      required this.fullName,
      required this.displayName,
      required this.age});

  ///---- copyWith------///
  SicklerUserProfileInfo copyWith({
    String? uid,
    String? gender,
    String? fullName,
    String? displayName,
    int? age,
  }) {
    return SicklerUserProfileInfo(
        uid: uid ?? this.uid,
        gender: gender ?? this.gender,
        fullName: fullName ?? this.fullName,
        displayName: displayName ?? this.displayName,
        age: age ?? this.age);
  }

  /// ------ To and From Map ------///

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "uid": uid,
      "gender": gender,
      "fullName": fullName,
      "displayName": displayName,
      "age": age
    };
    return data;
  }

  factory SicklerUserProfileInfo.fromMap(Map<String, dynamic> data) {
    return SicklerUserProfileInfo(
        uid: data["uid"],
        gender: data["gender"],
        fullName: data["fullName"],
        displayName: data["displayName"],
        age: data["age"]);
  }

  ///--------Empty------------///

  static SicklerUserProfileInfo empty = const SicklerUserProfileInfo(
    uid: "",
    gender: "",
    fullName: "",
    displayName: "",
    age: 0,
  );
  bool get isEmpty => this == SicklerUserProfileInfo.empty;
  bool get isNotEmpty => this != SicklerUserProfileInfo.empty;

  @override
  String toString() =>
      "SicklerUserInfo(uid: $uid, gender: $gender, fullName: $fullName, displayName: $displayName, age: $age)";

  @override
  List<Object?> get props => [displayName, age, displayName, age];
}
