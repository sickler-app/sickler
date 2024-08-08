import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/services/user/remote/user_service.dart';

import '../../models/models.dart';
import '../../services/auth/auth_service.dart';
import '../../services/user/local/user_local_service.dart';

class UserRepository {
  final UserService userService;
  final UserLocalService userLocalService;
  final AuthService authService;

  UserRepository(
      {required this.userService,
      required this.userLocalService,
      required this.authService});

  FutureEither<SicklerUser> getCurrentUserData(
      {bool forceRefresh = false}) async {
    return futureHandler(() async {
      ///First get from Firebase Auth in order to verify if the user is actually signed in before making any calls to remote;

      User? currentUser = await authService.getCurrentUser();

      if (currentUser == null) {
        ///If user is not signed in, return an empty class

        await userLocalService.deleteUser();
        return SicklerUser.empty;
      }

      if (forceRefresh) {
        return await _getRemoteUser(currentUser.uid);
      }

      SicklerUser localUser = await userLocalService.getUser();
      if (localUser.isNotEmpty) {
        return localUser;
      }

      return await _getRemoteUser(currentUser.uid);
    });
  }

  Future<SicklerUser> _getRemoteUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userService.getUserData(uid);

    if (documentSnapshot.exists &&
        documentSnapshot.data() != null &&
        documentSnapshot.data()!.isNotEmpty) {
      SicklerUser remoteUser =
          SicklerUser.fromMap(data: documentSnapshot.data()!);
      await userLocalService.addUser(remoteUser);
      return remoteUser;
    } else {
      throw Exception("User data doesn't exist");
    }
  }

  FutureEither<void> updateUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    return futureHandler(() async {
      await userLocalService.updateUser(user);
      if (updateRemote) {
        await userService.updateUserData(user);
      }
    });
  }

  FutureEither<void> addUserData(
      {required SicklerUser user, bool updateRemote = false}) async {
    return futureHandler(() async {
      await userLocalService.updateUser(user);
      if (updateRemote) {
        await userService.addUserData(user);
      }
    });
  }

  /// --------- Delete User Data --------///
  FutureEither<void> deleteUserData(
      {required SicklerUser user, bool deleteRemote = false}) async {
    return futureHandler(() async {
      await userLocalService.deleteUser(user: user);

      if (deleteRemote) {
        await userService.deleteUserData(user.uid);
      }
    });
  }
}
