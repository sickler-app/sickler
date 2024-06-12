import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserService();

  ///----Get User Data--------///
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfileData(
      String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('users').doc(uid).get();
    return snapshot;
  }

  ///--------User Profile Data--------///
  Future<void> addUserProfileData(
      SicklerUserProfileInfo userProfileInfo) async {
    Map<String, Map<String, dynamic>> profileData = {
      "profile": userProfileInfo.toMap()
    };
    await firestore
        .collection('users')
        .doc(userProfileInfo.uid)
        .set(profileData);
  }

  Future<void> updateUserProfileData(
      SicklerUserProfileInfo userProfileInfo) async {
    Map<String, Map<String, dynamic>> profileData = {
      "profile": userProfileInfo.toMap()
    };
    await firestore
        .collection('users')
        .doc(userProfileInfo.uid)
        .update(profileData);
  }

  ///--------User Health Data--------///
  Future<void> addUserHealthData(SicklerUserHealthInfo healthInfo) async {
    Map<String, Map<String, dynamic>> healthData = {
      "health": healthInfo.toMap()
    };
    await firestore.collection('users').doc(healthInfo.uid).set(healthData);
  }

  Future<void> updateUserHealthData(SicklerUserHealthInfo healthInfo) async {
    Map<String, Map<String, dynamic>> healthData = {
      "health": healthInfo.toMap()
    };
    await firestore.collection('users').doc(healthInfo.uid).update(healthData);
  }

  ///-----Delete -----///
  Future<void> deleteUserData(String uid) async {
    await firestore.collection("users").doc(uid).delete();
  }
}
