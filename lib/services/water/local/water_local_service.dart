import 'package:isar/isar.dart';
import 'package:sickler/models/water/water_log.dart';
import 'package:sickler/services/local_db/databse_service.dart';

class WaterLocalService extends LocalDbService {
  late Future<Isar> db;
  WaterLocalService() {
    db = initializeDB();
  }

  ///Todo: Implement isar and water logs

  Future<List<WaterLog>> getWaterLogs() async {
    throw UnimplementedError();
    // final isar = await db;
    //
    // List<WaterLog> waterLogs = await isar.waterLogs.where().findAll();
    // return waterLogs;
  }

  Future<void> addWaterLog(WaterLog log) async {
    throw UnimplementedError();
  }

  Future<void> update(WaterLog log) async {
    throw UnimplementedError();
  }

  Future<void> deleteWaterLog(WaterLog log) async {
    throw UnimplementedError();
  }

  Future<void> clear() async {
    throw UnimplementedError();
  }
}
