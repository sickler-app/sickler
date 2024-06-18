import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/models/user/user_preferences.dart';

class UserPreferencesService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///---Get User Preferences
  ///

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserPreferences(
      String uid) async {
    return await firestore.collection('user').doc(uid).get();
  }

  Future<void> addUserPreferences(
      {required UserPreferences preferences, required String uid}) async {
    Map<String, Map<String, dynamic>> preferencesMap = {
      "preferences": preferences.toMap()
    };
    await firestore.collection('users').doc(uid).set(preferencesMap);
  }

  Future<void> updateUserPreferences(
      {required UserPreferences preferences, required String uid}) async {
    Map<String, Map<String, dynamic>> preferencesMap = {
      "preferences": preferences.toMap()
    };
    await firestore.collection('users').doc(uid).update(preferencesMap);
  }
}
