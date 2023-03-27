import 'dart:async';

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
          'CREATE TABLE places(id INTEGER PRIMARY KEY, name TEXT, tag TEXT,location TEXT, image TEXT,price REAL)',
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

  Future<void> insertDummyData() async {
    final place = Place(
      id: 1,
      name: 'Lugar 1',
      tag: 'ida y vuelta',
      location: 'Argentina',
      image: Uri.parse(
          'https://www.peru.travel/Contenido/Home/Imagen/en/12/1.9/Banner/start-en-ds.jpg'),
      price: 600,
    );
    final place2 = Place(
      id: 2,
      name: 'Cancun',
      tag: 'Mexico',
      location: 'solo ida',
      image: Uri.parse(
          'https://media.staticontent.com/media/pictures/ebce817f-05a2-48d0-9ed2-1afa41805e30'),
      price: 10000,
    );
    final place3 = Place(
      id: 3,
      name: 'Machu Pichu',
      tag: 'ida y vuelta',
      location: 'Peru',
      image: Uri.parse(
          'https://www.metrojourneys.com/wp-content/uploads/2019/07/machu-picchu-peru-tours.jpg'),
      price: 4500.23,
    );
    await insertPlace(place);
    await insertPlace(place2);
    await insertPlace(place3);
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
