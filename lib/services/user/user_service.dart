import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/models/profile/sickler_health_info_model.dart';

class UserService {
  final String uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserService({required this.uid});

  ///----Get User Data--------///
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfileData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('users').doc(uid).get();
    return snapshot;
  }

  ///--------User Profile Data--------///
  Future<void> addUserProfileData(SicklerUser user) async {
    Map<String, Map<String, dynamic>> profileData = {"profile": user.toMap()};
    await firestore.collection('users').doc(uid).set(profileData);
  }

  Future<void> updateUserProfileData(SicklerUser user) async {
    Map<String, Map<String, dynamic>> profileData = {"profile": user.toMap()};
    await firestore.collection('users').doc(uid).update(profileData);
  }

  ///--------User Health Data--------///
  Future<void> addUserHealthData(SicklerHealthInfo healthInfo) async {
    Map<String, Map<String, dynamic>> healthData = {
      "health": healthInfo.toMap()
    };
    await firestore.collection('users').doc(uid).set(healthData);
  }

  Future<void> updateUserHealthData(SicklerHealthInfo healthInfo) async {
    Map<String, Map<String, dynamic>> healthData = {
      "health": healthInfo.toMap()
    };
    await firestore.collection('users').doc(uid).update(healthData);
  }

  ///-----Delete -----///
  Future<void> deleteUserProfileData() async {
    await firestore.collection("users").doc(uid).delete();
  }
}
