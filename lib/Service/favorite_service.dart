import 'dart:async';

import 'package:nav/Model/favorite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteService {
  FavoriteService();

  Future<Database> getDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'favorites_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE data_user(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<List<Favorite>> getFavorites() async {
    final Database db = await getDb();

    final List<Map<String, dynamic>> maps = await db.query('data_user');

    return List.generate(maps.length, (i) {
      return Favorite(
        id: maps[i]['id'],
        name: maps[i]['name'],
        imgUrl: maps[i]['imgUrl'],
        location: maps[i]['location'],
        price: maps[i]['price'],
      );
    });
  }
}
