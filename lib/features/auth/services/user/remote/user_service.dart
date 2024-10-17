import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../auth.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///----Get User Data--------///
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('users').doc(uid).get();
    return snapshot;
  }

  ///--------Add and Update User Data--------///
  Future<void> addUserData(AppUser user) async {
    await firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<void> updateUserData(AppUser user) async {
    await firestore.collection('users').doc(user.uid).update(user.toMap());
  }

  ///-----Delete -----///
  Future<void> deleteUserData(String uid) async {
    await firestore.collection("users").doc(uid).delete();
  }
}
