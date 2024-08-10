import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/water/water_log.dart';

class WaterService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///----Get Water Logs----///

  Future<DocumentSnapshot<Map<String, dynamic>>> getWaterLogs(
      String uid) async {
    ///Todo: Think about the possible collection path for water and update
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .get();
    return snapshot;
  }

  ///----Add Water Log----///
  Future<void> addWaterLog(
      {required WaterLog waterLog, required String uid}) async {
    ///Use transactions here
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .update({
      "entries": FieldValue.arrayUnion([waterLog.toMap()])
    });
  }

  ///----Add Water Log----///
  Future<void> updateWaterLog(
      {required WaterLog waterLog, required String uid}) async {
    ///Write operation
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
  Future<void> deleteWaterLog(
      {required WaterLog waterLog, required String uid}) async {
    ///Use transactions here
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
    ///Use transactions here
    await firestore
        .collection('users')
        .doc(uid)
        .collection("logs")
        .doc("water")
        .delete();
  }
}
