import 'package:isar/isar.dart';
import 'package:sickler/features/auth/models/user/app_user.dart';
import 'package:sickler/databse_service.dart';

class UserLocalService extends LocalDbService {
  late Future<Isar> db;

  UserLocalService() {
    db = initializeDB();
  }

  Stream<List<AppUser>> listenUserPreferences() async* {
    final isar = await db;
    yield* isar.appUsers.where().watch();
  }

  Future<AppUser> getUser() async {
    final isar = await db;
    List<AppUser> userList = await isar.appUsers.where().findAll();
    if (userList.isEmpty) {
      return AppUser.empty;
    } else {
      return userList.first;
    }
  }

  Future<void> addUser(AppUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.appUsers.put(user);
    });
  }

  Future<void> updateUser(AppUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.appUsers.put(user);
    });
  }

  Future<void> deleteUser({AppUser? user}) async {
    final isar = await db;

    if (user == null) {
      await isar.writeTxn(() async {
        await isar.appUsers.clear();
      });
    } else {
      await isar.writeTxn(() async {
        await isar.appUsers.delete(user.id);
      });
    }
  }
}
