import 'package:isar/isar.dart';
import 'package:sickler/models/user/user_preferences.dart';
import 'package:sickler/services/user/local/databse_service.dart';

class UserPreferencesLocalDBService extends LocalDatabaseService {
  late Future<Isar> db;

  UserPreferencesLocalDBService() {
    db = initializeDB();
  }

  Stream<List<UserPreferences>> listenUserPreferences() async* {
    final isar = await db;
    yield* isar.userPreferences.where().watch();
  }

  Future<UserPreferences> getUserPreferences() async {
    final isar = await db;
    return (await isar.userPreferences.where().findAll()).first;
  }

  Future<void> addUserPreferences(UserPreferences userPreferences) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.userPreferences.put(userPreferences);
    });
  }

  Future<void> deleteUserPreferences(UserPreferences userPreferences) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.userPreferences.delete(userPreferences.id);
    });
  }
}
