import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/user/user_preferences.dart';

class LocalDatabaseService {
  ///Pass all collection Schemas here
  Future<Isar> initializeDB() async {
    final directory = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UserPreferencesSchema],
          inspector: true, directory: directory.path);
    }
    return Future.value(Isar.getInstance());
  }
}