import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/profile/sickler_health_info_model.dart';
import 'package:sickler/services/user/user_service.dart';

import '../../models/models.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  ///------ Get User Profile Data -------///
  Map<String, dynamic>? userData;
  Future<void> getAllUserData() async {
    ///Todo: Get data from local storage first
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userService.getUserProfileData();
    userData = documentSnapshot.data();
  }

  FutureEither<SicklerUser> getUserProfileData() async {
    return callFutureMethod(() async {
      if (userData != null) {
        Map<String, dynamic> profileData = userData?["profile"];
        SicklerUser user = SicklerUser.fromMap(data: profileData);
        return user;
      } else {
        ///If null, get all user data again
        await getAllUserData();
        Map<String, dynamic> profileData = userData?["profile"];
        SicklerUser user = SicklerUser.fromMap(data: profileData);
        return user;
      }
    });
  }

  FutureEither<SicklerHealthInfo> getUserHealthData() async {
    return callFutureMethod(() async {
      if (userData != null) {
        Map<String, dynamic> healthData = userData?["health"];
        SicklerHealthInfo userHealthInfo =
            SicklerHealthInfo.fromMap(healthData);
        return userHealthInfo;
      } else {
        ///If null, get all user data again
        await getAllUserData();
        Map<String, dynamic> healthData = userData?["health"];
        SicklerHealthInfo userHealthInfo =
            SicklerHealthInfo.fromMap(healthData);
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
  FutureEither<void> addUserProfileData(SicklerUser user) async {
    return callFutureMethod(() async {
      await userService.addUserProfileData(user);
    });
  }

  FutureEither<void> updateUserProfileData(SicklerUser user) async {
    return callFutureMethod(() async {
      await userService.updateUserProfileData(user);
    });
  }

  ///------User Health Data---------///
  FutureEither<void> addUserHealthDataData(SicklerHealthInfo healthInfo) async {
    return callFutureMethod(() async {
      await userService.addUserHealthData(healthInfo);
    });
  }

  FutureEither<void> updateUserHealthDataData(
      SicklerHealthInfo healthInfo) async {
    return callFutureMethod(() async {
      await userService.updateUserHealthData(healthInfo);
    });
  }

  /// --------- Delete User Data --------///
  FutureEither<void> deleteUserProfileData() async {
    return callFutureMethod(() async {
      await userService.deleteUserProfileData();
    });
  }
}
