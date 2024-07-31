import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/services/user/remote/user_service.dart';

import '../../models/models.dart';
import '../../services/user/local/user_local_service.dart';

class UserRepository {
  final UserService userService;
  final UserLocalService userLocalService;

  UserRepository({required this.userService, required this.userLocalService});

  FutureEither<SicklerUser> getUserData(
      {String? uid, bool getFromRemote = false}) async {
    return callFutureMethod(() async {
      ///If uid is null, get from local. Else then check if local is empty,
      ///then get from remote if its empty

      if (uid != null && getFromRemote) {
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await userService.getUserData(uid);

        if (documentSnapshot.exists) {
          Map<String, dynamic>? userDataMap = documentSnapshot.data();

          SicklerUser user = SicklerUser.fromMap(data: userDataMap!);
          return user;
        } else {
          //Rather than return and empty class and having to constantly check if
          //the document is not empty, just throw and exception so my 'callFutureMethod()'
          // can catch it and return a failure.
          throw Exception("The data doesn't exist");
        }
      }
      return await userLocalService.getUser();
    });
  }

  ///------User Health Data---------///
  FutureEither<void> addUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    return callFutureMethod(() async {
      await userLocalService.addUser(user);
      if (updateRemote) {
        await userService.addUserData(user);
      }
    });
  }

  FutureEither<void> updateUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    return callFutureMethod(() async {
      await userLocalService.updateUser(user);

      if (updateRemote) {
        await userService.updateUserData(user);
      }
    });
  }

  /// --------- Delete User Data --------///
  FutureEither<void> deleteUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    return callFutureMethod(() async {
      await userService.deleteUserData(user.uid);

      if (updateRemote) {
        await userLocalService.deleteUser(user);
      }
    });
  }
}
