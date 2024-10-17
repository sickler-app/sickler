import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/services/user/remote/user_service.dart';

import '../../models/models.dart';
import '../../services/auth/auth_service.dart';
import '../../services/user/local/user_local_service.dart';

class UserRepository {
  final UserService _userService;
  final UserLocalService _userLocalService;
  final AuthService _authService;

  UserRepository(
      {required UserService userService,
      required UserLocalService userLocalService,
      required AuthService authService})
      : _authService = authService,
        _userLocalService = userLocalService,
        _userService = userService;

  FutureEither<CircleUser> getCurrentUserData(
      {bool forceRefresh = false}) async {
    return futureHandler(() async {
      ///First get from Firebase Auth in order to verify if the user is actually signed in before making any calls to remote;

      User? currentUser = await _authService.getCurrentUser();

      if (currentUser == null) {
        ///If user is not signed in, return an empty class
        log("User is not signed in");
        await _userLocalService.deleteUser();
        return CircleUser.empty;
      }

      if (forceRefresh) {
        log("Force refresh from remote");
        return await _getRemoteUser(currentUser.uid);
      }

      CircleUser localUser = await _userLocalService.getUser();
      if (localUser.isNotEmpty) {
        log("Local User Found");
        return localUser;
      } else {
        log("Local user is empty");
        await _userLocalService.deleteUser();
        return CircleUser.empty;
      }

    });
  }

  Future<CircleUser> _getRemoteUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _userService.getUserData(uid);

    if (documentSnapshot.exists &&
        documentSnapshot.data() != null &&
        documentSnapshot.data()!.isNotEmpty) {
      CircleUser remoteUser =
          CircleUser.fromMap(data: documentSnapshot.data()!);
      await _userLocalService.addUser(remoteUser);
      return remoteUser;
    } else {
      throw Exception("User data doesn't exist");
    }
  }

  FutureEither<void> updateUserData(
      {required CircleUser user, bool updateRemote = false}) async {
    return futureHandler(() async {
      await _userLocalService.updateUser(user);
      if (updateRemote) {
        await _userService.updateUserData(user);
      }
    });
  }

  FutureEither<void> addUserData(
      {required CircleUser user, bool updateRemote = false}) async {
    return futureHandler(() async {
      await _userLocalService.updateUser(user);
      if (updateRemote) {
        await _userService.addUserData(user);
      }
    });
  }

  /// --------- Delete User Data --------///
  FutureEither<void> deleteUserData(
      {required CircleUser user, bool deleteRemote = false}) async {
    return futureHandler(() async {
      await _userLocalService.deleteUser(user: user);

      if (deleteRemote) {
        await _userService.deleteUserData(user.uid);
      }
    });
  }
}
