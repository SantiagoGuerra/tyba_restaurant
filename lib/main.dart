import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tyba_restaurant/infrastructure/theme/theme.dart';
import 'package:tyba_restaurant/presentation/shared/loading/loading.controller.dart';
import 'firebase_options.dart';
import 'package:path/path.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'tyba_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, lon DOUBLE, lat DOUBLE)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  final loading = LoadingController();
  Get.put(loading);

  final connect = GetConnect();
  // final url = ConfigEnvironments.getEnvironments()['url'];
  // connect.baseUrl = url;
  connect.timeout = const Duration(seconds: 20);
  connect.httpClient.maxAuthRetries = 0;

  // connect.httpClient.addRequestModifier<dynamic>(
  //   (request) {
  //     final storage = Get.find<GetStorage>();
  //     final token = storage.read(StorageConstants.tokenAuthorization);
  //     if (token != null) {
  //       request.headers['Authorization'] = 'Bearer $token';
  //     }
  //     return request;
  //   },
  // );

  Logger().i('Conectado em: connect');
  Get.put(connect);

  await GetStorage.init();
  Get.put(GetStorage());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      theme: themeData,
      getPages: Nav.routes,
    );
  }
}
