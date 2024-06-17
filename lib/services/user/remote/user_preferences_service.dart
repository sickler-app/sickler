import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/models/user/user_preferences.dart';

class UserPreferencesService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///---Get User Preferences
  ///

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserPreferences() async {
    ///Todo: Implement getUserPreferences

    throw UnimplementedError();
  }

  Future<void> addUserPreferences(
      {required UserPreferences preferences, required String uid}) async {
    await firestore.collection('users').doc(uid).set(preferences.toMap());
  }

  Future<void> updateUserPreferences(
      {required UserPreferences preferences, required String uid}) async {
    await firestore.collection('users').doc(uid).update(preferences.toMap());
  }
}
