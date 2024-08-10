import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/services/water/remote/water_service.dart';

import '../../services/water/local/water_local_service.dart';

class WaterRepository {
  final WaterService _waterService;
  final WaterLocalService _waterLocalService;

  WaterRepository(
      {required WaterService waterService,
      required WaterLocalService waterLocalService})
      : _waterLocalService = waterLocalService,
        _waterService = waterService;

  FutureEither<List<WaterLog>> getWaterLogs(
      {SicklerUser? user, bool? getFromRemote}) async {
    return futureHandler(() async {
      List<WaterLog> logs = [];

      ///Get from Remote when instructed
      if (user != null && getFromRemote != null && getFromRemote) {
        logs = await _getRemoteLogs(user.uid);
        if (logs.isNotEmpty) {
          //If Not empty, return, else get from local
          return logs;
        }
      }
      logs = await _waterLocalService.getWaterLogs();

      if (logs.isEmpty) {
        throw Exception("No Logs found");
      }
      return logs;
    });
  }

  Future<List<WaterLog>> _getRemoteLogs(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _waterService.getWaterLogs(uid);

    if (documentSnapshot.exists &&
        documentSnapshot.data() != null &&
        documentSnapshot.data()!.isNotEmpty) {
      List<WaterLog> logs =
          List<WaterLog>.from(documentSnapshot.data()!["entries"]);

      return logs;
    } else {
      throw Exception("User data doesn't exist");
    }
  }

  FutureEither<void> addWaterLog({
    required WaterLog log,
    required SicklerUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.addWaterLog(log);
      if (updateRemote) {
        await _waterService.addWaterLog(waterLog: log, uid: user.uid);
      }
    });
  }

  FutureEither<void> updateWaterLog({
    required WaterLog log,
    required SicklerUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.update(log);
      if (updateRemote) {
        await _waterService.updateWaterLog(waterLog: log, uid: user.uid);
      }
    });
  }

  FutureEither<void> deleteLog({
    required WaterLog log,
    required SicklerUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.deleteWaterLog(log);
      if (updateRemote) {
        await _waterService.deleteWaterLog(waterLog: log, uid: user.uid);
      }
    });
  }

  FutureEither<void> clear({
    required SicklerUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.clear();
      if (updateRemote) {
        await _waterService.clear(uid: user.uid);
      }
    });
  }

  ///Todo: Add Operations for manipulating data, eg querying with filters, calculating stats, etc
}
