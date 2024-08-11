import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/models/water/water_preferences.dart';

import '../../../models/water/water_log.dart';

class WaterService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///----Water Logs Section----///

  Future<DocumentSnapshot<Map<String, dynamic>>> getLogs(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .get();
    return snapshot;
  }

  Future<void> addLog({required WaterLog waterLog, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .set(
      {
        "entries": FieldValue.arrayUnion([waterLog.toMap()])
      },
      SetOptions(merge: true),
    );
  }

  ///----Add Water Log----///
  Future<void> updateLog(
      {required WaterLog waterLog, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc('water')
        .update({
      "entries": FieldValue.arrayUnion([waterLog.toMap()])
    });
  }

  ///----delete Water Log----///
  Future<void> deleteLog(
      {required WaterLog waterLog, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .update({
      "entries": FieldValue.arrayRemove([waterLog.toMap()])
    });
  }

  ///----delete Water Log----///
  Future<void> clear({required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .delete();
  }

  /// ----- Water Preferences Section ----- ///

  Future<DocumentSnapshot<Map<String, dynamic>>> getPreferences(
      String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .get();
    return snapshot;
  }

  Future<void> addPreferences(
      {required WaterPreferences preferences, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .set(preferences.toMap(), SetOptions(merge: true));
  }

  Future<void> updatePreferences(
      {required WaterPreferences preferences, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .update(preferences.toMap());
  }

  Future<void> deletePreferences(String uid) async {
    ///This will actually delete the preferences plus the logs
    ///So rather just set the preferences to the default;

    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .update(const WaterPreferences.initial().toMap());
  }
}
