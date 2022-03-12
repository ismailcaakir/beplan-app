import 'package:get/get_state_manager/get_state_manager.dart';

import '../../database.dart';

abstract class BaseController extends GetxController {
  AppDatabase? dbConnection;
  Future<AppDatabase> connection() async {
    var database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    return database;
  }
}
