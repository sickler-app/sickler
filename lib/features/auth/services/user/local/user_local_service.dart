import 'package:isar/isar.dart';
import 'package:sickler/features/auth/models/app_user.dart';
import 'package:sickler/services/local_db/databse_service.dart';

class UserLocalService extends LocalDbService {
  late Future<Isar> db;

  UserLocalService() {
    db = initializeDB();
  }

  Stream<List<AppUser>> listenUserPreferences() async* {
    final isar = await db;
    yield* isar.sicklerUsers.where().watch();
  }

  Future<AppUser> getUser() async {
    final isar = await db;
    List<AppUser> userList = await isar.sicklerUsers.where().findAll();
    if (userList.isEmpty) {
      return AppUser.empty;
    } else {
      return userList.first;
    }
  }

  Future<void> addUser(AppUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.put(user);
    });
  }

  Future<void> updateUser(AppUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.put(user);
    });
  }

  Future<void> deleteUser({AppUser? user}) async {
    final isar = await db;

    if (user == null) {
      await isar.writeTxn(() async {
        await isar.sicklerUsers.clear();
      });
    } else {
      await isar.writeTxn(() async {
        await isar.sicklerUsers.delete(user.id);
      });
    }
  }
}
