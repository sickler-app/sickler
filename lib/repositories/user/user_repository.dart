import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/services/user/user_service.dart';

import '../../models/models.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  ///------ Get User Profile Data -------///
  Map<String, dynamic>? userData;
  Future<void> getAllUserData(String uid) async {
    ///Todo: Get data from local storage first
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userService.getUserProfileData(uid);
    userData = documentSnapshot.data();
  }

  FutureEither<SicklerUserProfileInfo> getUserProfileData(String uid) async {
    return callFutureMethod(() async {
      if (userData != null) {
        Map<String, dynamic> profileData = userData?["profile"];
        SicklerUserProfileInfo profileInfo =
            SicklerUserProfileInfo.fromMap(profileData);
        return profileInfo;
      } else {
        ///If null, get all user data again
        await getAllUserData(uid);
        Map<String, dynamic> profileData = userData?["profile"];

        SicklerUserProfileInfo profileInfo =
            SicklerUserProfileInfo.fromMap(profileData);
        return profileInfo;
      }
    });
  }

  FutureEither<SicklerUserHealthInfo> getUserHealthData(String uid) async {
    return callFutureMethod(() async {
      if (userData != null) {
        Map<String, dynamic> healthData = userData?["health"];
        SicklerUserHealthInfo userHealthInfo =
            SicklerUserHealthInfo.fromMap(healthData);
        return userHealthInfo;
      } else {
        ///If null, get all user data again
        await getAllUserData(uid);
        Map<String, dynamic> healthData = userData?["health"];
        SicklerUserHealthInfo userHealthInfo =
            SicklerUserHealthInfo.fromMap(healthData);
        return userHealthInfo;
      }
    });
  }
  // FutureEither<SicklerUser> getUserProfileData() async {
  //   return callFutureMethod(() async {
  //     DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
  //         await userService.getUserProfileData();
  //
  //     Map<String, dynamic>? userData = documentSnapshot.data();
  //     Map<String, dynamic> profileData = userData?["profile"];
  //     SicklerUser user = SicklerUser.fromMap(data: profileData);
  //     return user;
  //   });
  // }

  ///------User Profile Data---------///
  FutureEither<void> addUserProfileData(
      SicklerUserProfileInfo userProfileInfo) async {
    return callFutureMethod(() async {
      await userService.addUserProfileData(userProfileInfo);
    });
  }

  FutureEither<void> updateUserProfileData(
      SicklerUserProfileInfo userProfileInfo) async {
    return callFutureMethod(() async {
      await userService.updateUserProfileData(userProfileInfo);
    });
  }

  ///------User Health Data---------///
  FutureEither<void> addUserHealthDataData(
      SicklerUserHealthInfo healthInfo) async {
    return callFutureMethod(() async {
      await userService.addUserHealthData(healthInfo);
    });
  }

  FutureEither<void> updateUserHealthDataData(
      SicklerUserHealthInfo healthInfo) async {
    return callFutureMethod(() async {
      await userService.updateUserHealthData(healthInfo);
    });
  }

  /// --------- Delete User Data --------///
  FutureEither<void> deleteUserData(String uid) async {
    return callFutureMethod(() async {
      await userService.deleteUserData(uid);
    });
  }
}
