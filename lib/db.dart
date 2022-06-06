import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'cities.db'),
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE cities (id INTEGER PRIMARY KEY, address TEXT, lon REAL, lat REAL)');
    }, version: 1);
  }

  static Future<void> insert(CityModel cityModel) async {
    Database database = await _openDB();
    await database.insert('cities', cityModel.toMap());
  }

  static Future<List<CityModel>> getCities() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> citiesMap = await database.query("cities");
    return List.generate(
        citiesMap.length,
        (i) => CityModel(
            address: citiesMap[i]['address'],
            position: PositionModel(
                lat: citiesMap[i]['lat'], lon: citiesMap[i]['lon'])));
  }
}
