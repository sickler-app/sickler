import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/models.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///----Get User Data--------///
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('users').doc(uid).get();
    return snapshot;
  }

  ///--------Add and Update User Data--------///
  Future<void> addUserData(SicklerUserInfo userInfo) async {
    await firestore.collection('users').doc(userInfo.uid).set(userInfo.toMap());
  }

  Future<void> updateUserData(SicklerUserInfo userInfo) async {
    await firestore
        .collection('users')
        .doc(userInfo.uid)
        .update(userInfo.toMap());
  }

  ///-----Delete -----///
  Future<void> deleteUserData(String uid) async {
    await firestore.collection("users").doc(uid).delete();
  }
}
