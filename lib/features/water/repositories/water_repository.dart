import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/models/water/water_preferences.dart';
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

  ///------Water Log Section----///
  FutureEither<List<WaterLog>> getWaterLogs(
      {AppUser? user,
      bool? getFromRemote,
      DateTime? start,
      DateTime? end}) async {
    return futureHandler(() async {
      List<WaterLog> logs = [];

      ///Get from Remote when instructed
      if (user != null && getFromRemote != null && getFromRemote) {
        logs = await _getRemoteLogs(user.uid);
        if (logs.isNotEmpty) {
          //If Not empty, return, else get from local
          return logs;
        } else {
          log("No Logs found from Remote");
          return [];
        }
      }

      logs = await _waterLocalService.getWaterLogs(start: start, end: end);

      return logs;
    });
  }

  Future<List<WaterLog>> _getRemoteLogs(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _waterService.getLogs(uid);

    if (documentSnapshot.exists &&
        documentSnapshot.data() != null &&
        documentSnapshot.data()!.isNotEmpty) {
      List<WaterLog> otherLogs = documentSnapshot.data()!["entries"].map((e) {
        return WaterLog.fromMap(e);
      }).toList();

      // List<WaterLog> logs =
      //     List<WaterLog>.from(documentSnapshot.data()!["entries"]);

      return otherLogs;
    } else {
      log("Log data doesn't exist from Remote");
      return [];
      // throw Exception("Log data doesn't exist");
    }
  }

  FutureEither<void> addWaterLog({
    required WaterLog log,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.addWaterLog(log);
      if (updateRemote) {
        await _waterService.addLog(waterLog: log, uid: user.uid);
      }
    });
  }

  FutureEither<void> updateWaterLog({
    required WaterLog log,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.update(log);
      if (updateRemote) {
        await _waterService.updateLog(waterLog: log, uid: user.uid);
      }
    });
  }

  FutureEither<void> deleteLog({
    required WaterLog log,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.deleteWaterLog(log);
      if (updateRemote) {
        await _waterService.deleteLog(waterLog: log, uid: user.uid);
      }
    });
  }

  FutureEither<void> clear({
    required AppUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.clear();
      if (updateRemote) {
        await _waterService.clear(uid: user.uid);
      }
    });
  }

  FutureEither<int> count({
    required AppUser user,
  }) async {
    return futureHandler(() async {
      return await _waterLocalService.count();
    });
  }

  ///------Water Preferences Section----///

  FutureEither<WaterPreferences> getWaterPreferences(
      {AppUser? user,
      bool? getFromRemote,
      DateTime? start,
      DateTime? end}) async {
    return futureHandler(() async {
      WaterPreferences? preferences;

      ///Get from Remote when instructed
      if (user != null && getFromRemote != null && getFromRemote) {
        preferences = await _getRemotePreferences(user.uid);
        if (preferences.isNotEmpty) {
          //If Not empty, return, else get from local
          return preferences;
        } else {
          throw Exception("No Preferences found");
        }
      }

      preferences = await _waterLocalService.getPreferences();

      if (preferences.isEmpty) {
        throw Exception("No Preferences found found");
      }
      return preferences;
    });
  }

  Future<WaterPreferences> _getRemotePreferences(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _waterService.getPreferences(uid);

    if (documentSnapshot.exists &&
        documentSnapshot.data() != null &&
        documentSnapshot.data()!.isNotEmpty) {
      Map<String, dynamic>? data = documentSnapshot.data();
      WaterPreferences preferences = WaterPreferences.fromMap(data!);

      return preferences;
    } else {
      throw Exception("Preferences doesn't exist");
    }
  }

  FutureEither<void> addPreferences({
    required WaterPreferences preferences,
    required AppUser? user,
    bool? updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.addPreferences(preferences);
      if (updateRemote! && user != null) {
        await _waterService.addPreferences(
            preferences: preferences, uid: user.uid);
      }
    });
  }

  FutureEither<void> updatePreferences({
    required WaterPreferences preferences,
    required AppUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.updatePreferences(preferences);
      if (updateRemote) {
        await _waterService.updatePreferences(
            preferences: preferences, uid: user.uid);
      }
    });
  }

  FutureEither<void> deletePreferences({
    required AppUser user,
    bool updateRemote = false,
  }) async {
    return futureHandler(() async {
      await _waterLocalService.deletePreferences();
      if (updateRemote) {
        await _waterService.deletePreferences(user.uid);
      }
    });
  }

  ///Todo: Add Operations for manipulating data, eg querying with filters, calculating stats, etc
}
