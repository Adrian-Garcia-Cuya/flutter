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
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY, name TEXT, img TEXT, price TEXT, country TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertFavorite(Favorite favorite) async {
    final Database db = await getDb();

    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDummy() async {
    Favorite fv = Favorite(
        id: '1',
        name: 'Lugar 1',
        img:
            'https://www.peru.travel/Contenido/Home/Imagen/en/12/1.9/Banner/start-en-ds.jpg',
        price: '600',
        country: 'Argentina');
    await insertFavorite(fv);
  }

  Future<void> deleteFavorite(String id) async {
    final Database db = await getDb();

    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Favorite>> getFavorites() async {
    final Database db = await getDb();

    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      Favorite fvNew = Favorite(
        id: maps[i]['id'].toString(),
        name: maps[i]['name'],
        img: maps[i]['img'],
        country: maps[i]['country'],
        price: maps[i]['price'],
      );
      return fvNew;
    });
  }
}
