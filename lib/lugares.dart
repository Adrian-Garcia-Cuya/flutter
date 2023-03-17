import 'package:flutter/material.dart';

class Lugares extends StatelessWidget {
  const Lugares({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "https://www.peru.travel/Contenido/Home/Imagen/en/12/1.9/Banner/start-en-ds.jpg",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Cancun",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2E2E2E)),
                              ),
                              const Text(
                                "ida y vuelta",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(253, 26, 0, 131),
                                    borderRadius: BorderRadius.circular(60.0)),
                                child: IconButton(
                                  onPressed: () {
                                    print("favoritos");
                                  },
                                  icon: const Icon(Icons.favorite_border),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "s./345.99",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2E2E2E)),
                              ),
                              const Text(
                                "del 03/03 al 14/03",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  print("ver vuelo");
                                },
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
            }));
  }
}
