import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isar/isar.dart';

import '../../auth.dart';

part 'app_user.g.dart';

@Collection(inheritance: false)
class AppUser extends Equatable {
  final Id id = 1;
  final String uid;
  final String email;
  final String? photoUrl;
  final bool isAnonymous;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final UserProfile profile;
  final UserPreferences preferences;

  const AppUser({
    required this.email,
    required this.isAnonymous,
    required this.uid,
    this.photoUrl,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.profile = UserProfile.empty,
    this.preferences = UserPreferences.empty,
  });

  ///-------copyWith--------///
  AppUser copyWith({
    String? email,
    bool? isAnonymous,
    String? uid,
    String? photoUrl,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    UserProfile? profile,
    UserPreferences? preferences,
  }) {
    return AppUser(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      profile: profile ?? this.profile,
      preferences: preferences ?? this.preferences,
    );
  }

  ///-----To Map and From Map------///

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "uid": uid,
      "email": email,
      "photoUrl": photoUrl,
      "isAnonymous": isAnonymous,
      "isEmailVerified": isEmailVerified,
      "isPhoneVerified": isPhoneVerified,
      "profile": profile.toMap(),
      "preferences": preferences.toMap(),
    };

    return data;
  }

  factory AppUser.fromMap({required Map<String, dynamic> data}) {
    return AppUser(
        profile: UserProfile.fromMap(data["profile"]),
        preferences: UserPreferences.fromMap(data: data["preferences"]),
        email: data["email"],
        uid: data["uid"],
        isAnonymous: data["isAnonymous"],
        isEmailVerified: data["isEmailVerified"],
        isPhoneVerified: data["isPhoneVerified"]);
  }

  factory AppUser.fromUser({required User? user}) {
    if (user == null) {
      return AppUser.empty;
    } else {
      return AppUser(
        email: user.email!,
        uid: user.uid,
        isEmailVerified: user.emailVerified,
        isAnonymous: user.isAnonymous,
        photoUrl: user.photoURL,
      );
    }
  }

  ///-------Empty--------///

  @ignore
  static AppUser empty =
      const AppUser(email: "", isAnonymous: false, uid: "");
  @ignore
  bool get isEmpty => this == AppUser.empty;
  @ignore
  bool get isNotEmpty => this != AppUser.empty;

  @override
  String toString() {
    if (this == AppUser.empty) {
      return "SicklerUser.empty";
    }

    return super.toString();
  }

  @ignore
  @override
  bool? get stringify => true;

  @ignore
  @override
  List<Object?> get props => [
        email,
        photoUrl,
        isAnonymous,
        isEmailVerified,
        uid,
        isPhoneVerified,
        profile,
        preferences,
      ];
}
