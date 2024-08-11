import 'package:isar/isar.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/models/water/water_preferences.dart';
import 'package:sickler/services/local_db/databse_service.dart';

class WaterLocalService extends LocalDbService {
  late Future<Isar> db;
  WaterLocalService() {
    db = initializeDB();
  }

  ///----Water Logs ----///
  Future<List<WaterLog>> getWaterLogs({DateTime? start, DateTime? end}) async {
    final isar = await db;
    List<WaterLog> waterLogs = [];
    if (start == null && end == null) {
      waterLogs = await isar.waterLogs
          .filter()
          .timestampBetween(start!, end!)
          .findAll();
    }
    waterLogs = await isar.waterLogs.where().findAll();
    if (waterLogs.isEmpty) {
      throw Exception("No water logs found");
    }

    return waterLogs;
  }

  Future<void> addWaterLog(WaterLog log) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.waterLogs.put(log);
    });
  }

  Future<void> update(WaterLog log) async {
    ///Todo; verify this update method works.
    final isar = await db;

    WaterLog? oldLog = await isar.waterLogs.get(log.id);

    if (oldLog == null) {
      throw Exception("Log not found");
    }

    oldLog = oldLog.copyWith(
      amount: log.amount,
      timestamp: log.timestamp,
    );
    await isar.writeTxn(() async {
      await isar.waterLogs.put(oldLog!);
    });
  }

  Future<void> deleteWaterLog(WaterLog log) async {
    final isar = await db;

    await isar.writeTxn(() async {
      await isar.waterLogs.delete(log.id);
    });
  }

  Future<void> clear() async {
    final isar = await db;

    await isar.writeTxn(() async {
      await isar.waterLogs.clear();
    });
  }

  Future<int> count() async {
    final isar = await db;
    return await isar.waterLogs.count();
  }

  /// ----- Water Preferences Section ----- ///

  Future<WaterPreferences> getPreferences() async {
    final isar = await db;

    WaterPreferences? preferences =
        await isar.waterPreferences.where().findFirst();
    if (preferences == null) {
      throw Exception("No water Preferences found");
    }
    return preferences;
  }

  Future<void> addPreferences(WaterPreferences preferences) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.waterPreferences.put(preferences);
    });
  }

  Future<void> updatePreferences(WaterPreferences preferences) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.waterPreferences.put(preferences);
    });
  }

  Future<void> deletePreferences() async {
    final isar = await db;

    await isar.writeTxn(() async {
      await isar.waterPreferences.clear();
    });
  }
}
