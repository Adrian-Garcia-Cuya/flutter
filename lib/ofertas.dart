import 'package:flutter/material.dart';
import 'API/api_flight.dart';
import 'Model/offer.dart';

class Ofertas extends StatelessWidget {
  const Ofertas({super.key});

  Future<List<Offer>> generarOfertas() async {
    return await OfferApi().fetchOffer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: FutureBuilder(
            future: generarOfertas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            snapshot.data?[index].img.toString() ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 220,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        snapshot.data?[index].name ?? '',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2E2E2E),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        snapshot.data?[index].tag ?? '',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              253, 26, 0, 131),
                                          borderRadius:
                                              BorderRadius.circular(60.0)),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_border),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "s./${double.tryParse(snapshot.data?[index].price.toString() ?? "0")! / 2}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffD2001A),
                                              ),
                                            ),
                                            Text(
                                              '/s/.${snapshot.data?[index].price.toString()}',
                                              style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffB2B2B2),
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Fecha: ${snapshot.data?[index].date.toString()}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Ver vuelo"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
