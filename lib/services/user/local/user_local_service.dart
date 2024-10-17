import 'package:isar/isar.dart';
import 'package:sickler/models/user/sickler_user.dart';
import 'package:sickler/services/local_db/databse_service.dart';

class UserLocalService extends LocalDbService {
  late Future<Isar> db;

  UserLocalService() {
    db = initializeDB();
  }

  Stream<List<CircleUser>> listenUserPreferences() async* {
    final isar = await db;
    yield* isar.sicklerUsers.where().watch();
  }

  Future<CircleUser> getUser() async {
    final isar = await db;
    List<CircleUser> userList = await isar.sicklerUsers.where().findAll();
    if (userList.isEmpty) {
      return CircleUser.empty;
    } else {
      return userList.first;
    }
  }

  Future<void> addUser(CircleUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.put(user);
    });
  }

  Future<void> updateUser(CircleUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.sicklerUsers.put(user);
    });
  }

  Future<void> deleteUser({CircleUser? user}) async {
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
