import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../water.dart';

class WaterService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String month = DateFormat('MMMM').format(DateTime.now());
  String year = DateTime.now().year.toString();

  ///----Water Logs Section----///

  Future<DocumentSnapshot<Map<String, dynamic>>> getLogs(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('logs')
        .doc(uid)
        .collection('water')
        .doc("${month}_$year")
        .get();
    return snapshot;
  }

  Future<void> addLog({required WaterLog waterLog, required String uid}) async {
    await firestore
        .collection('logs')
        .doc(uid)
        .collection('water')
        .doc("${month}_$year")
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
        .collection('logs')
        .doc(uid)
        .collection('water')
        .doc("${month}_$year")
        .update({
      "entries": FieldValue.arrayUnion([waterLog.toMap()])
    });
  }

  ///----delete Water Log----///
  Future<void> deleteLog(
      {required WaterLog waterLog, required String uid}) async {
    await firestore
        .collection('logs')
        .doc(uid)
        .collection('water')
        .doc("${month}_$year")
        .update({
      "entries": FieldValue.arrayRemove([waterLog.toMap()])
    });
  }

  ///----delete Water Log----///
  Future<void> clear({required String uid}) async {
    await firestore
        .collection('logs')
        .doc(uid)
        .collection('water')
        .doc("${month}_$year")
        .delete();
  }

  /// ----- Water Preferences Section ----- ///

  Future<DocumentSnapshot<Map<String, dynamic>>> getPreferences(
      String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection('preferences')
        .doc('water')
        .get();
    return snapshot;
  }

  Future<void> addPreferences(
      {required WaterPreferences preferences, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('preferences')
        .doc('water')
        .set(preferences.toMap(), SetOptions(merge: true));
  }

  Future<void> updatePreferences(
      {required WaterPreferences preferences, required String uid}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('preferences')
        .doc('water')
        .update(preferences.toMap());
  }

  Future<void> deletePreferences(String uid) async {
    ///This will actually delete the preferences plus the logs
    ///So rather just set the preferences to the default;

    await firestore
        .collection('users')
        .doc(uid)
        .collection('preferences')
        .doc('water')
        .update(const WaterPreferences.initial().toMap());
  }
}
