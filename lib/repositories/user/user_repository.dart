import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/services/user/user_service.dart';

import '../../models/models.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  FutureEither<SicklerUserInfo> getUserData(String uid) async {
    return callFutureMethod(() async {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await userService.getUserData(uid);

      if (documentSnapshot.exists) {
        Map<String, dynamic>? userDataMap = documentSnapshot.data();

        SicklerUserInfo userInfo = SicklerUserInfo.fromMap(userDataMap!);
        return userInfo;
      } else {
        //Rather than return and empty class and having to constantly check if
        //the document is not empty, just throw and exception so my 'callFutureMethod()'
        // can catch it and return a failure.
        throw Exception("The data doesn't exist");
      }
    });
  }

  ///------User Health Data---------///
  FutureEither<void> addUserData(SicklerUserInfo userInfo) async {
    return callFutureMethod(() async {
      await userService.addUserData(userInfo);
    });
  }

  FutureEither<void> updateUserData(SicklerUserInfo userInfo) async {
    return callFutureMethod(() async {
      await userService.updateUserData(userInfo);
    });
  }

  /// --------- Delete User Data --------///
  FutureEither<void> deleteUserData(String uid) async {
    return callFutureMethod(() async {
      await userService.deleteUserData(uid);
    });
  }
}
