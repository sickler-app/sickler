import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sickler/models/models.dart';

import '../../models/user/sickler_user.dart';

class LocalDbService {
  ///Pass all collection Schemas here
  Future<Isar> initializeDB() async {
    final directory = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([SicklerUserSchema],
          inspector: true, directory: directory.path);
    }
    return Future.value(Isar.getInstance());
  }
}
