import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'features/auth/models/user/app_user.dart';
import 'features/water/water.dart';

class LocalDbService {
  ///Pass all collection Schemas here
  Future<Isar> initializeDB() async {
    final directory = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
          [AppUserSchema, WaterPreferencesSchema, WaterLogSchema],
          inspector: true, directory: directory.path);
    }
    return Future.value(Isar.getInstance());
  }
}
