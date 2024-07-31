import 'package:isar/isar.dart';
import 'package:sickler/models/user/sickler_user.dart';
import 'package:sickler/services/local_db/databse_service.dart';

class UserLocalService extends LocalDbService {
  late Future<Isar> db;

  UserLocalService() {
    db = initializeDB();
  }

  Stream<List<SicklerUser>> listenUserPreferences() async* {
    final isar = await db;
    yield* isar.sicklerUsers.where().watch();
  }

  Future<SicklerUser> getUser() async {
    final isar = await db;
    List<SicklerUser> userList = await isar.sicklerUsers.where().findAll();
    if (userList.isEmpty) {
      return SicklerUser.empty;
    } else {
      return userList.first;
    }
  }

  Future<void> addUser(SicklerUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.put(user);
    });
  }

  Future<void> updateUser(SicklerUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.put(user);
    });
  }

  Future<void> deleteUser(SicklerUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.delete(user.id);
    });
  }
}
