import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:nav/Model/place.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PlaceService {
  PlaceService();

  Future<Database> getDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'places_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE places(id INTEGER PRIMARY KEY, name TEXT, description TEXT, image TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPlace(Place place) async {
    final Database db = await getDb();

    await db.insert(
      'places',
      place.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Place>> places() async {
    final Database db = await getDb();

    final List<Map<String, dynamic>> maps = await db.query('places');

    return List.generate(maps.length, (i) {
      return Place(
        id: maps[i]['id'],
        name: maps[i]['name'],
        tag: maps[i]['tag'],
        location: maps[i]['location'],
        image: Uri.parse(maps[i]['image']),
        price: maps[i]['price'],
      );
    });
  }

  Future<void> updatePlace(Place place) async {
    final db = await getDb();

    await db.update(
      'places',
      place.toMap(),
      where: 'id = ?',
      whereArgs: [place.id],
    );
  }

  Future<void> deletePlace(int id) async {
    final db = await getDb();

    await db.delete(
      'places',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
