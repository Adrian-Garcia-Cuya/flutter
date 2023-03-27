import 'package:flutter/material.dart';

import 'Model/favorite.dart';
import 'Service/favorite_service.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  Future<List<Favorite>> favorites() async {
    FavoriteService favoriteService = FavoriteService();
    final countDB = await favoriteService.getFavorites();
    if (countDB.isEmpty) {
      await favoriteService.insertDummy();
      return favoriteService.getFavorites();
    }
    return countDB;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: FutureBuilder(
          future: favorites(),
          builder: (context, snp) {
            // ignore: prefer_is_empty
            if (snp.hasData && snp.data?.length != 0) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemCount: snp.data?.length ?? 0,
                itemBuilder: (context, index) {
                  // return Text(snp.data?[index].name ?? '');
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: Column(
                      children: [
                        Image.network(
                          snp.data?[index].img.toString() ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                snp.data?[index].name.toString() ?? '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snp.data?[index].country.toString() ?? '',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () async {
                                  FavoriteService favoriteService =
                                      FavoriteService();
                                  await favoriteService.deleteFavorite(
                                      snp.data?[index].id.toString() as String);
                                  setState(() {});
                                },
                                child: const Text('Eliminar'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Text('No tienes favoritos');
          },
        ),
      ),
    );
  }
}
