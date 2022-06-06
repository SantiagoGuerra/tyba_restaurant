import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tyba_restaurant/infrastructure/theme/theme.dart';
import 'package:tyba_restaurant/initializer.dart';
import 'package:tyba_restaurant/presentation/shared/loading/loading.controller.dart';
import 'firebase_options.dart';
import 'package:path/path.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  await Initializer.init();

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
