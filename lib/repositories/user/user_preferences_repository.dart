import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/services/user/local/user_preferences_database_service.dart';
import 'package:sickler/services/user/remote/user_preferences_service.dart';

import '../../models/user/user_preferences.dart';

class UserPreferencesRepository {
  final UserPreferencesService _userPreferencesService;
  final UserPreferencesLocalDBService _userPreferencesLocalDatabaseService;

  UserPreferencesRepository(
      {required UserPreferencesService userPreferencesService,
      required UserPreferencesLocalDBService
          userPreferencesLocalDatabaseService})
      : _userPreferencesService = userPreferencesService,
        _userPreferencesLocalDatabaseService =
            userPreferencesLocalDatabaseService;

  FutureEither<UserPreferences> getUserPreferences(String? uid) async {
    return callFutureMethod(() async {
      if (uid == null || uid.isEmpty) {
        //If no uid is provided get from local
        UserPreferences localPrefs =
            await _userPreferencesLocalDatabaseService.getUserPreferences();

        if (localPrefs.isEmpty) {
          return UserPreferences.empty;
        } else {
          return localPrefs;
        }
      } else {
        //Get from remote if remote if uid is provided
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await _userPreferencesService.getUserPreferences(uid);
        Map<String, dynamic>? preferencesMap = documentSnapshot.data();
        return UserPreferences.fromMap(data: preferencesMap!);
      }
    });
  }

  FutureEither<Stream<List<UserPreferences>>> listenUserPreferences() async {
    return callFutureMethod(() async {
      //Get from local
      return _userPreferencesLocalDatabaseService.listenUserPreferences();
    });
  }

  FutureEither<void> addUserPreferencesToLocal(
      UserPreferences userPreferences) async {
    return callFutureMethod(() async {
      //Add to Local
      await _userPreferencesLocalDatabaseService
          .addUserPreferences(userPreferences);
    });
  }

  FutureEither<void> addUserPreferencesToRemote(
      UserPreferences userPreferences) async {
    return callFutureMethod(() async {
      //Add to remote
      await _userPreferencesService.addUserPreferences(
          preferences: userPreferences, uid: userPreferences.uid);
    });
  }

  FutureEither<void> updateUserPreferences(
      UserPreferences userPreferences) async {
    return callFutureMethod(() async {
      //Add to Local
      await _userPreferencesLocalDatabaseService
          .addUserPreferences(userPreferences);
      //Add to Remote
      await _userPreferencesService.addUserPreferences(
          preferences: userPreferences, uid: userPreferences.uid);
    });
  }

  FutureEither<void> deleteUserPreferences(
      UserPreferences userPreferences) async {
    return callFutureMethod(() async {
      //Delete from Local
      await _userPreferencesLocalDatabaseService
          .deleteUserPreferences(userPreferences);

      //Delete from Remote
      await _userPreferencesService.updateUserPreferences(
          preferences: userPreferences, uid: userPreferences.uid);
    });
  }
}
