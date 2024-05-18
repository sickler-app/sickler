import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/core.dart';

class SicklerUser extends Equatable {
  final String? displayName;
  final String? email;
  final String? photoURL;
  final String? phoneNumber;
  final bool? isAnonymous;
  final bool? isEmailVerified;
  final Genotype? genotype;
  final String uid;

  const SicklerUser({
    required this.displayName,
    required this.email,
    this.genotype,
    this.photoURL,
    this.phoneNumber,
    this.isAnonymous,
    this.isEmailVerified,
    required this.uid,
  });

  ///-------copyWith--------///
  SicklerUser copyWith({
    String? displayName,
    String? email,
    String? photoURL,
    String? phoneNumber,
    bool? isAnonymous,
    bool? isEmailVerified,
    Genotype? genotype,
    String? uid,
  }) {
    return SicklerUser(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      uid: uid ?? this.uid,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      genotype: genotype ?? this.genotype,
    );
  }

  ///-----To Map and From Map------///

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "uid": uid,
      "displayName": displayName,
      "email": email,
      "phoneNumber": phoneNumber,
      "isAnonymous": isAnonymous,
      "isEmailVerified": isEmailVerified,
      "genotype": genotype.toString(),
    };

    return data;
  }

  factory SicklerUser.fromMap({required Map<String, dynamic> data}) {
    return SicklerUser(
        displayName: data["displayName"],
        email: data["email"],
        uid: data["uid"],
        phoneNumber: data["phoneNumber"],
        isAnonymous: data["isAnonymous"],
        isEmailVerified: data["isEmailVerified"],
        genotype: data["genotype"]);
  }

  factory SicklerUser.fromUser({required User? user}) {
    if (user == null) {
      return SicklerUser.empty;
    } else {

    return SicklerUser(
      displayName: user.displayName,
      email: user.email,
      uid: user.uid,
      phoneNumber: user.phoneNumber,
      isEmailVerified: user.emailVerified,
      isAnonymous: user.isAnonymous,
    );
  }
  }

  ///-------Empty--------///
  static SicklerUser empty =
      const SicklerUser(displayName: "", email: "", uid: "");
  bool get isEmpty => this == SicklerUser.empty;
  bool get isNotEmpty => this != SicklerUser.empty;

  @override
  List<Object?> get props => [
        displayName,
        email,
        photoURL,
        phoneNumber,
        isAnonymous,
        isEmailVerified,
        genotype,
        uid
      ];
}
